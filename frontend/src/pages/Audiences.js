import React, { useEffect, useState } from 'react';
import { fetchAudiences } from '../api';
import MetricCard from '../components/cards/MetricCard';
import DataTable from '../components/filters/DataTable';

const Audiences = () => {
  const [audiences, setAudiences] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadAudiences = async () => {
      try {
        setLoading(true);
        const data = await fetchAudiences();
        setAudiences(data);
      } catch (error) {
        console.error('Ошибка загрузки аудиторий:', error);
      } finally {
        setLoading(false);
      }
    };
    loadAudiences();
  }, []);

  const columns = [
    { field: 'number', headerName: 'Номер', width: 120 },
    { field: 'capacity', headerName: 'Вместимость', width: 150 },
    { field: 'type', headerName: 'Тип', width: 200 },
    { field: 'building', headerName: 'Корпус', width: 150 },
  ];

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Аудитории</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
        <MetricCard 
          title="Всего аудиторий" 
          value={audiences.length} 
        />
        <MetricCard 
          title="Средняя вместимость" 
          value={audiences.reduce((acc, curr) => acc + curr.capacity, 0) / audiences.length || 0} 
        />
        <MetricCard 
          title="Лекционные" 
          value={audiences.filter(a => a.type === 'Лекционная').length} 
        />
      </div>

      <div className="bg-white p-4 rounded-lg shadow">
        {loading ? (
          <div className="flex justify-center items-center h-64">
            <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-blue-500"></div>
          </div>
        ) : (
          <DataTable
            rows={audiences}
            columns={columns}
          />
        )}
      </div>
    </div>
  );
};

export default Audiences;