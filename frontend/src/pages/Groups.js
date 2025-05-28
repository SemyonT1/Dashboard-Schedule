import React, { useEffect, useState } from 'react';
import { fetchGroups, fetchGroupLoad } from '../api';
import LineChart from '../components/charts/LineChart';
import MetricCard from '../components/cards/MetricCard';
import SelectInput from '../components/filters/SelectInput';

const Groups = () => {
  const [groups, setGroups] = useState([]);
  const [selectedGroup, setSelectedGroup] = useState(null);
  const [groupData, setGroupData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadGroups = async () => {
      try {
        const data = await fetchGroups();
        setGroups(data);
        if (data.length > 0) setSelectedGroup(data[0].id);
      } catch (error) {
        console.error('Ошибка загрузки групп:', error);
      }
    };
    loadGroups();
  }, []);

  useEffect(() => {
    if (!selectedGroup) return;
    
    const loadGroupData = async () => {
      try {
        setLoading(true);
        const data = await fetchGroupLoad(selectedGroup);
        setGroupData(data);
      } catch (error) {
        console.error('Ошибка загрузки данных группы:', error);
      } finally {
        setLoading(false);
      }
    };
    loadGroupData();
  }, [selectedGroup]);

  const chartData = {
    labels: groupData?.weekly_load?.map(item => item.date) || [],
    datasets: [
      {
        label: 'Количество пар',
        data: groupData?.weekly_load?.map(item => item.total_pairs) || [],
        borderColor: 'rgb(53, 162, 235)',
        backgroundColor: 'rgba(53, 162, 235, 0.5)',
      },
    ],
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Статистика по группам</h1>
      
      <div className="mb-6 w-64">
        <SelectInput
          options={groups.map(group => ({ value: group.id, label: group.name }))}
          value={selectedGroup}
          onChange={setSelectedGroup}
          placeholder="Выберите группу"
        />
      </div>

      {loading ? (
        <div className="flex justify-center items-center h-64">
          <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-blue-500"></div>
        </div>
      ) : (
        <>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
            <MetricCard 
              title="Общее количество пар" 
              value={groupData?.total_pairs || 0} 
            />
            <MetricCard 
              title="Средняя нагрузка" 
              value={groupData?.average_pairs_per_day?.toFixed(1) || 0} 
            />
            <MetricCard 
              title="Преподаватели" 
              value={groupData?.teachers_count || 0} 
            />
          </div>

          <div className="bg-white p-4 rounded-lg shadow mb-6">
            <LineChart 
              data={chartData} 
              title="Нагрузка по неделям" 
            />
          </div>
        </>
      )}
    </div>
  );
};

export default Groups;