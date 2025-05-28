const API_BASE_URL = 'http://localhost:8080';

// Обработчик ответов
const handleResponse = async (response) => {
  if (!response.ok) {
    const errorData = await response.json().catch(() => ({}));
    const error = new Error(errorData.message || `HTTP error! status: ${response.status}`);
    error.status = response.status;
    error.data = errorData;
    throw error;
  }
  return response.json();
};

// Основные функции API:

// 1. Общая статистика
export const fetchOverallLoad = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/overall-load`);
    return await handleResponse(response);
  } catch (error) {
    console.error('[API] Ошибка загрузки общей нагрузки:', error);
    throw error;
  }
};

// 2. Статистика по группе
export const fetchGroupLoad = async (groupId) => {
  try {
    const response = await fetch(`${API_BASE_URL}/group-load/${groupId}`);
    return await handleResponse(response);
  } catch (error) {
    console.error(`[API] Ошибка загрузки нагрузки для группы ${groupId}:`, error);
    throw error;
  }
};

// 3. Статистика по преподавателю
export const fetchTeacherLoad = async (teacherId) => {
  try {
    const response = await fetch(`${API_BASE_URL}/teacher-load/${teacherId}`);
    return await handleResponse(response);
  } catch (error) {
    console.error(`[API] Ошибка загрузки нагрузки для преподавателя ${teacherId}:`, error);
    throw error;
  }
};

// 4. Недельная нагрузка
export const fetchWeeklyLoad = async (startDate, endDate) => {
  try {
    const params = new URLSearchParams();
    if (startDate) params.append('start', startDate);
    if (endDate) params.append('end', endDate);
    
    const response = await fetch(`${API_BASE_URL}/weekly-load?${params.toString()}`);
    return await handleResponse(response);
  } catch (error) {
    console.error('[API] Ошибка загрузки недельной нагрузки:', error);
    throw error;
  }
};

// 5. Списки данных
export const fetchGroups = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/groups`);
    return await handleResponse(response);
  } catch (error) {
    console.error('[API] Ошибка загрузки списка групп:', error);
    throw error;
  }
};

export const fetchTeachers = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/teachers`);
    return await handleResponse(response);
  } catch (error) {
    console.error('[API] Ошибка загрузки списка преподавателей:', error);
    throw error;
  }
};

export const fetchAudiences = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/audiences`);
    return await handleResponse(response);
  } catch (error) {
    console.error('[API] Ошибка загрузки списка аудиторий:', error);
    throw error;
  }
};


/**
 * Получение расписания на день
 * @param {string} date - Дата в формате YYYY-MM-DD
 */
export const fetchDailySchedule = async (date) => {
  try {
    const response = await fetch(`${API_BASE_URL}/daily?date=${date}`);
    return await handleResponse(response);
  } catch (error) {
    console.error('[API] Ошибка загрузки дневного расписания:', error);
    throw error;
  }
};