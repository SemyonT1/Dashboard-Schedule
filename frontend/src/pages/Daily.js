import React, { useEffect, useState } from 'react';
import { fetchDailySchedule } from '../api';
import ScheduleTable from '../components/filters/ScheduleTable';
import DatePicker from '../components/filters/DatePicker';

const Daily = () => {
  const [schedule, setSchedule] = useState([]);
  const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const loadSchedule = async () => {
      try {
        setLoading(true);
        const data = await fetchDailySchedule(selectedDate);
        setSchedule(data);
      } catch (error) {
        console.error('Ошибка загрузки расписания:', error);
      } finally {
        setLoading(false);
      }
    };
    loadSchedule();
  }, [selectedDate]);

  return (
    <div className="p-6">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Расписание на день</h1>
        <DatePicker
          value={selectedDate}
          onChange={setSelectedDate}
        />
      </div>

      {loading ? (
        <div className="flex justify-center items-center h-64">
          <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-blue-500"></div>
        </div>
      ) : (
        <div className="bg-white p-4 rounded-lg shadow">
          <ScheduleTable data={schedule} />
        </div>
      )}
    </div>
  );
};

export default Daily;