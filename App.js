import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Dashboard from './pages/Dashboard';
import Teachers from './pages/Teachers';
import Groups from './pages/Groups';
import Audiences from './pages/Audiences';
import Daily from './pages/Daily';
import './styles/index.css';

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-100">
        {/* Шапка с навигацией */}
        <nav className="bg-white shadow">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex justify-between h-16">
              <div className="flex items-center">
                <span className="text-xl font-bold">Дашборд расписания</span>
              </div>
              <div className="flex space-x-4">
                <Link
                  to="/"
                  className="px-3 py-2 rounded-md text-sm font-medium hover:bg-gray-100"
                >
                  Главная
                </Link>
                <Link
                  to="/teachers"
                  className="px-3 py-2 rounded-md text-sm font-medium hover:bg-gray-100"
                >
                  Преподаватели
                </Link>
                <Link
                  to="/groups"
                  className="px-3 py-2 rounded-md text-sm font-medium hover:bg-gray-100"
                >
                  Группы
                </Link>
                <Link
                  to="/audiences"
                  className="px-3 py-2 rounded-md text-sm font-medium hover:bg-gray-100"
                >
                  Аудитории
                </Link>
                <Link
                  to="/daily"
                  className="px-3 py-2 rounded-md text-sm font-medium hover:bg-gray-100"
                >
                  День
                </Link>
              </div>
            </div>
          </div>
        </nav>

        {/* Основное содержимое */}
        <div className="py-6">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <Routes>
              <Route path="/" element={<Dashboard />} />
              <Route path="/teachers" element={<Teachers />} />
              <Route path="/groups" element={<Groups />} />
              <Route path="/audiences" element={<Audiences />} />
              <Route path="/daily" element={<Daily />} />
            </Routes>
          </div>
        </div>
      </div>
    </Router>
  );
}

export default App;