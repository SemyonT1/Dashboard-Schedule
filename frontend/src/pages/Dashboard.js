import React, { useEffect, useState } from 'react';
import LineChart from '../components/charts/LineChart';
import MetricCard from '../components/cards/MetricCard';
import { fetchOverallLoad, fetchWeeklyLoad } from '../api';

const Dashboard = () => {
  const [data, setData] = useState({
    overallLoad: null,
    weeklyLoad: null,
    groupsCount: null,
    teachersCount: null
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const loadData = async () => {
      try {
        setLoading(true);
        setError(null);
        
        const [overall, weekly] = await Promise.all([
          fetchOverallLoad(),
          fetchWeeklyLoad()
        ]);
        
        setData({
          overallLoad: overall?.total_pairs ?? 0,
          weeklyLoad: weekly ?? [],
          groupsCount: overall?.groups_count ?? '-',
          teachersCount: overall?.teachers_count ?? '-'
        });
      } catch (err) {
        console.error('Failed to load data:', err);
        setError('Не удалось загрузить данные. Попробуйте обновить страницу.');
      } finally {
        setLoading(false);
      }
    };

    loadData();
  }, []);

  if (loading) {
    return (
      <div className="p-6 flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-blue-500"></div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="p-6 bg-red-50 rounded-lg">
        <p className="text-red-500">{error}</p>
        <button 
          onClick={() => window.location.reload()}
          className="mt-2 px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
        >
          Обновить
        </button>
      </div>
    );
  }

  const weeklyChartData = {
    labels: data.weeklyLoad.map(item => item.date),
    datasets: [
      {
        label: 'Количество пар',
        data: data.weeklyLoad.map(item => item.total_pairs),
        borderColor: 'rgb(75, 192, 192)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        tension: 0.1,
        fill: true
      },
    ],
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Общая статистика</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
        <MetricCard 
          title="Общее количество пар" 
          value={data.overallLoad} 
          icon="📊"
        />
        <MetricCard 
          title="Количество групп" 
          value={data.groupsCount} 
          icon="👥"
        />
        <MetricCard 
          title="Количество преподавателей" 
          value={data.teachersCount} 
          icon="👨‍🏫"
        />
      </div>
      
      <div className="bg-white p-4 rounded-lg shadow mb-6">
        <h2 className="text-xl font-semibold mb-4">Нагрузка за неделю</h2>
        <LineChart 
          data={weeklyChartData} 
          options={{
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
            },
          }}
        />
      </div>
    </div>
  );
};

export default Dashboard;