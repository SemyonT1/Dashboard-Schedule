import React, { useEffect, useState } from 'react';
import LineChart from '../components/charts/LineChart';
import SelectInput from '../components/filters/SelectInput';
import { fetchTeachers, fetchTeacherLoad } from '../services/api';

const Teachers = () => {
  const [teachers, setTeachers] = useState([]);
  const [selectedTeacher, setSelectedTeacher] = useState(null);
  const [teacherLoad, setTeacherLoad] = useState(null);

  useEffect(() => {
    const loadTeachers = async () => {
      const data = await fetchTeachers();
      setTeachers(data);
    };
    loadTeachers();
  }, []);

  useEffect(() => {
    if (selectedTeacher) {
      const loadTeacherData = async () => {
        const data = await fetchTeacherLoad(selectedTeacher);
        setTeacherLoad(data);
      };
      loadTeacherData();
    }
  }, [selectedTeacher]);

  const chartData = teacherLoad ? {
    labels: ['Нагрузка преподавателя'],
    datasets: [
      {
        label: 'Количество пар',
        data: [teacherLoad.pairs_count],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1,
      },
    ],
  } : null;

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Аналитика преподавателей</h1>
      
      <div className="bg-white p-4 rounded-lg shadow mb-6">
        <SelectInput
          options={teachers}
          label="Выберите преподавателя"
          onChange={(e) => setSelectedTeacher(e.target.value)}
          value={selectedTeacher || ''}
        />
      </div>
      
      {chartData && (
        <div className="bg-white p-4 rounded-lg shadow mb-6">
          <LineChart 
            data={chartData} 
            title={`Нагрузка преподавателя: ${teacherLoad.teacher_name}`} 
          />
        </div>
      )}
    </div>
  );
};

export default Teachers;