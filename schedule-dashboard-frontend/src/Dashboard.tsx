import React, { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Skeleton } from "@/components/ui/skeleton";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  BarChart,
  Bar,
} from "recharts";

const API_BASE = import.meta.env.VITE_API_BASE || "http://localhost:8080";

async function api<T>(path: string): Promise<T> {
  const res = await fetch(API_BASE + path);
  if (!res.ok) throw new Error(await res.text());
  return res.json();
}

type OverallLoad = { total_pairs: number };
type Group = { group_id: number; group_title: string };
type GroupLoad = { group_title: string; pairs_count: number };
type Teacher = { teacher_id: number; fio: string };
type TeacherLoad = { teacher_name: string; pairs_count: number };
type WeeklyLoad = { date: string; total_pairs: number };
type Audience = { audience_id: number; room: string };
type AudienceUtilization = { audience_id: number; room: string; load_count: number };
type DailyLoad = { date: string; total_pairs: number };

export default function Dashboard() {
  const [overall, setOverall] = useState<OverallLoad | null>(null);
  const [groups, setGroups] = useState<Group[]>([]);
  const [teachers, setTeachers] = useState<Teacher[]>([]);
  const [audiences, setAudiences] = useState<Audience[]>([]);
  const [selectedDate, setSelectedDate] = useState<string>("2025-02-10");
  const [daily, setDaily] = useState<DailyLoad | null>(null);
  const [selectedGroup, setSelectedGroup] = useState<number | null>(null);
  const [groupLoad, setGroupLoad] = useState<GroupLoad | null>(null);
  const [selectedTeacher, setSelectedTeacher] = useState<number | null>(null);
  const [teacherLoad, setTeacherLoad] = useState<TeacherLoad | null>(null);
  const [selectedAudience, setSelectedAudience] = useState<number | null>(null);

  const [audienceStats, setAudienceStats] = useState<Record<string, number>>({});
  const [audienceLoading, setAudienceLoading] = useState(true);

  const [weekly, setWeekly] = useState<WeeklyLoad[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const [allGroupsLoad, setAllGroupsLoad] = useState<GroupLoad[]>([]);
  const [allTeachersLoad, setAllTeachersLoad] = useState<TeacherLoad[]>([]);


  // Загрузка всех аудиторий 
  async function loadAudienceStats() {
    const start = 283519;
    const end = 286857;

    const stats: Record<string, number> = {};

    for (let id = start; id <= end; id++) {
      try {
        const data = await api<AudienceUtilization>(`/audience-utilization/${id}`);

        if (!data.room) continue;

        const room = data.room;

        if (!stats[room]) stats[room] = 0;
        stats[room] += 1;
      } catch (_) {}
    }

    setAudienceStats(stats);
    setAudienceLoading(false);
  }

  useEffect(() => {
    loadAudienceStats();
  }, []);

  
  // Основные загрузки
  useEffect(() => {
    setLoading(true);
    Promise.all([
      api<OverallLoad>("/overall-load"),
      api<Group[]>("/groups"),
      api<Teacher[]>("/teachers"),
      api<Audience[]>("/audiences"),
    ])
      .then(([ov, gs, ts, as]) => {
        setOverall(ov);
        setGroups(gs);
        setTeachers(ts);
        setAudiences(as);
      })
      .catch((err) => setError(String(err)))
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    api<DailyLoad>(`/daily-load/${selectedDate}`).then(setDaily).catch(() => setDaily(null));
    api<WeeklyLoad[]>(`/weekly-load/${selectedDate}`).then(setWeekly).catch(() => setWeekly([]));
  }, [selectedDate]);

  useEffect(() => {
    if (selectedGroup == null) return;
    api<GroupLoad>(`/group-load/${selectedGroup}`).then(setGroupLoad).catch(() => setGroupLoad(null));
  }, [selectedGroup]);

  useEffect(() => {
    if (selectedTeacher == null) return;
    api<TeacherLoad>(`/teacher-load/${selectedTeacher}`).then(setTeacherLoad).catch(() => setTeacherLoad(null));
  }, [selectedTeacher]);


  // Гистограммы групп/преподавателей
  useEffect(() => {
    if (groups.length === 0) return;
    Promise.all(
      groups.map((g) =>
        api<GroupLoad>(`/group-load/${g.group_id}`).catch(() => ({
          group_title: g.group_title,
          pairs_count: 0,
        }))
      )
    ).then(setAllGroupsLoad);
  }, [groups]);

  useEffect(() => {
    if (teachers.length === 0) return;
    Promise.all(
      teachers.map((t) =>
        api<TeacherLoad>(`/teacher-load/${t.teacher_id}`).catch(() => ({
          teacher_name: t.fio,
          pairs_count: 0,
        }))
      )
    ).then(setAllTeachersLoad);
  }, [teachers]);


  // Получение результата для выбранной аудитории
  const selectedAudienceRoom = audiences.find((a) => a.audience_id === selectedAudience)?.room ?? "";

  const audienceLoad = selectedAudienceRoom
    ? audienceStats[selectedAudienceRoom] ?? 0
    : null;


  // Рендер
  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-100 via-slate-50 to-blue-100 p-10">
      <div className="w-full space-y-10">
        <header className="text-center mb-10">
          <h1 className="text-4xl font-bold text-indigo-700 drop-shadow-sm">
            Аналитический дашборд расписания
          </h1>
          <p className="text-slate-600 mt-2">
            Отслеживайте нагрузку по группам, преподавателям и аудиториям
          </p>
        </header>

        {error && <p className="text-red-600 text-center">{error}</p>}

        <div className="flex flex-col items-center gap-6">

          {/* Общая нагрузка */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Общее количество пар</CardTitle></CardHeader>
            <CardContent>
              {loading ? <Skeleton className="h-8 w-24" /> : <p className="text-4xl">{overall?.total_pairs}</p>}
            </CardContent>
          </Card>

          {/* Дата */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Выбор даты</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <input
                type="date"
                value={selectedDate}
                onChange={(e) => setSelectedDate(e.target.value)}
                className="border border-slate-300 px-3 py-2 rounded-md"
              />
              <span>{daily ? `${daily.total_pairs} занятий` : "Нет данных"}</span>
            </CardContent>
          </Card>

          {/* Группа */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Нагрузка по группе</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <Select value={selectedGroup ? String(selectedGroup) : ""} onValueChange={(v) => setSelectedGroup(Number(v))}>
                <SelectTrigger className="w-64">
                  <SelectValue placeholder="Выбрать группу" />
                </SelectTrigger>
                <SelectContent>
                  {groups.map((g) => (
                    <SelectItem key={g.group_id} value={String(g.group_id)}>{g.group_title}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <span>{groupLoad ? `${groupLoad.pairs_count} занятий` : "—"}</span>
            </CardContent>
          </Card>

          {/* Преподаватель */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Нагрузка по преподавателю</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <Select value={selectedTeacher ? String(selectedTeacher) : ""} onValueChange={(v) => setSelectedTeacher(Number(v))}>
                <SelectTrigger className="w-64">
                  <SelectValue placeholder="Выбрать преподавателя" />
                </SelectTrigger>
                <SelectContent>
                  {teachers.map((t) => (
                    <SelectItem key={t.teacher_id} value={String(t.teacher_id)}>{t.fio}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <span>{teacherLoad ? `${teacherLoad.pairs_count} занятий` : "—"}</span>
            </CardContent>
          </Card>

          {/* Аудитория */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Загрузка аудитории</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <Select value={selectedAudience ? String(selectedAudience) : ""} onValueChange={(v) => setSelectedAudience(Number(v))}>
                <SelectTrigger className="w-64">
                  <SelectValue placeholder="Выбрать аудиторию" />
                </SelectTrigger>
                <SelectContent>
                  {audiences.map((a) => (
                    <SelectItem key={a.audience_id} value={String(a.audience_id)}>{a.room}</SelectItem>
                  ))}
                </SelectContent>
              </Select>

              {audienceLoading ? (
                <span>Идет анализ данных…</span>
              ) : (
                <span>
                  {audienceLoad !== null ? `${audienceLoad} занятий` : "—"}
                </span>
              )}
            </CardContent>
          </Card>

          {/* График недели */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700 text-center">Загрузка по дням (неделя)</CardTitle></CardHeader>
            <CardContent className="h-[400px]">
              <ResponsiveContainer width="100%" height="100%">
                <LineChart data={weekly}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="date" />
                  <YAxis />
                  <Tooltip />
                  <Line type="monotone" dataKey="total_pairs" stroke="#6366f1" strokeWidth={2} />
                </LineChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>

          {/* Группы */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-5xl">
            <CardHeader><CardTitle className="text-indigo-700 text-center">Нагрузка всех групп</CardTitle></CardHeader>
            <CardContent className="h-[500px]">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={allGroupsLoad}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="group_title" angle={-30} textAnchor="end" interval={0} height={80} />
                  <YAxis />
                  <Tooltip />
                  <Bar dataKey="pairs_count" fill="#6366f1" />
                </BarChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>

          {/* Преподаватели */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-5xl">
            <CardHeader><CardTitle className="text-indigo-700 text-center">Нагрузка всех преподавателей</CardTitle></CardHeader>
            <CardContent className="h-[500px] relative">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={allTeachersLoad}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="teacher_name" tick={false} />
                  <YAxis />
                  <Tooltip />
                  <Bar dataKey="pairs_count" fill="#3165e9" />
                </BarChart>
              </ResponsiveContainer>
              <div className="absolute bottom-4 left-0 right-0 text-center text-slate-600">
                Наведитесь на столбец, чтобы посмотреть подробности
              </div>
            </CardContent>
          </Card>
          {/* Гистограмма аудиторий */}
          <Card className="shadow-md bg-white/80 border border-slate-200 rounded-2xl w-full max-w-5xl">
            <CardHeader><CardTitle className="text-indigo-700 text-center">Нагрузка всех аудиторий</CardTitle></CardHeader>
            <CardContent className="h-[500px] relative">
              {audienceLoading ? (
                <div className="flex items-center justify-center h-full text-slate-600 text-lg">Идёт анализ данных аудиторий…</div>
              ) : (
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart
                    data={Object.keys(audienceStats).map((room) => ({
                      room: room,
                      load: audienceStats[room],
                    }))}
                  >
                    <CartesianGrid strokeDasharray="3 3" stroke="#d1d5db" />
                    <XAxis dataKey="room" tick={false} />
                    <YAxis stroke="#4b5563" />
                    <Tooltip
                      contentStyle={{ backgroundColor: "#f8fafc", borderColor: "#e2e8f0" }}
                      formatter={(val) => [`${val} занятий`, "Загрузка"]}
                    />
                    <Bar dataKey="load" fill="#8b5cf6" />
                  </BarChart>
                </ResponsiveContainer>
              )}

              <div className="absolute bottom-4 left-0 right-0 text-center text-slate-600 text-sm font-medium">Наведитесь на столбец, чтобы посмотреть подробности</div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}
