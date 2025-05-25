import React, { useEffect, useState } from 'react';
import LineChart from '../components/charts/LineChart';
import MetricCard from '../components/cards/MetricCard';
import { fetchOverallLoad, fetchWeeklyLoad } from '../services/api';

const Dashboard = () => {
  const [overallLoad, setOverallLoad] = useState(0);
  const [weeklyLoad, setWeeklyLoad] = useState([]);

  useEffect(() => {
    const loadData = async () => {
      const overall = await fetchOverallLoad();
      setOverallLoad(overall.total_pairs);
      
      const weekly = await fetchWeeklyLoad();
      setWeeklyLoad(weekly);
    };

    loadData();
  }, []);

  const weeklyChartData = {
    labels: weeklyLoad.map(item => item.date),
    datasets: [
      {
        label: 'Количество пар',
        data: weeklyLoad.map(item => item.total_pairs),
        borderColor: 'rgb(75, 192, 192)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
      },
    ],
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Общая статистика</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
        <MetricCard title="Общее количество пар" value={overallLoad} />
        <MetricCard title="Количество групп" value="-" />
        <MetricCard title="Количество преподавателей" value="-" />
      </div>
      
      <div className="bg-white p-4 rounded-lg shadow mb-6">
        <LineChart 
          data={weeklyChartData} 
          title="Нагрузка за неделю" 
        />
      </div>
    </div>
  );
};

export default Dashboard;