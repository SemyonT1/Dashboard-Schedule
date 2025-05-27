// 1. Определите базовый URL API (добавьте в начало файла)
const API_BASE_URL = 'http://localhost:8080'; // или ваш URL бэкенда

// 2. Все функции API
export const fetchOverallLoad = async () => {
  const response = await fetch(`${API_BASE_URL}/overall-load`);
  return response.json();
};

export const fetchGroupLoad = async (groupId) => {
  const response = await fetch(`${API_BASE_URL}/group-load/${groupId}`);
  return response.json();
};

export const fetchTeacherLoad = async (teacherId) => {
  const response = await fetch(`${API_BASE_URL}/teacher-load/${teacherId}`);
  return response.json();
};

export const fetchWeeklyLoad = async (startDate) => {
  const response = await fetch(`${API_BASE_URL}/weekly-load?start=${startDate}`);
  return response.json();
};

export const fetchGroups = async () => {
  const response = await fetch(`${API_BASE_URL}/groups`);
  return response.json();
};

export const fetchTeachers = async () => {
  const response = await fetch(`${API_BASE_URL}/teachers`);
  return response.json();
};

export const fetchAudiences = async () => {
  const response = await fetch(`${API_BASE_URL}/audiences`);
  return response.json();
};