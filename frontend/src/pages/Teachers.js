import React, { useEffect, useState } from 'react';
import { fetchTeachers, fetchTeacherLoad } from '../api';
import LineChart from '../components/charts/LineChart';
import MetricCard from '../components/cards/MetricCard';
import SelectInput from '../components/filters/SelectInput';

const Teachers = () => {
  const [teachers, setTeachers] = useState([]);
  const [selectedTeacher, setSelectedTeacher] = useState(null);
  const [teacherData, setTeacherData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadTeachers = async () => {
      try {
        const data = await fetchTeachers();
        setTeachers(data);
        if (data.length > 0) setSelectedTeacher(data[0].id);
      } catch (error) {
        console.error('Ошибка загрузки преподавателей:', error);
      }
    };
    loadTeachers();
  }, []);

  useEffect(() => {
    if (!selectedTeacher) return;
    
    const loadTeacherData = async () => {
      try {
        setLoading(true);
        const data = await fetchTeacherLoad(selectedTeacher);
        setTeacherData(data);
      } catch (error) {
        console.error('Ошибка загрузки данных преподавателя:', error);
      } finally {
        setLoading(false);
      }
    };
    loadTeacherData();
  }, [selectedTeacher]);

  const chartData = {
    labels: teacherData?.weekly_load?.map(item => item.date) || [],
    datasets: [
      {
        label: 'Количество пар',
        data: teacherData?.weekly_load?.map(item => item.total_pairs) || [],
        borderColor: 'rgb(255, 99, 132)',
        backgroundColor: 'rgba(255, 99, 132, 0.5)',
      },
    ],
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Статистика по преподавателям</h1>
      
      <div className="mb-6 w-64">
        <SelectInput
          options={teachers.map(teacher => ({ 
            value: teacher.id, 
            label: `${teacher.last_name} ${teacher.first_name[0]}.${teacher.middle_name[0]}.` 
          }))}
          value={selectedTeacher}
          onChange={setSelectedTeacher}
          placeholder="Выберите преподавателя"
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
              value={teacherData?.total_pairs || 0} 
            />
            <MetricCard 
              title="Группы" 
              value={teacherData?.groups_count || 0} 
            />
            <MetricCard 
              title="Аудитории" 
              value={teacherData?.audiences_count || 0} 
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

export default Teachers;