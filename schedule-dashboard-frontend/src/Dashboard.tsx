import React, { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Skeleton } from "@/components/ui/skeleton";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from "recharts";

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
type AudienceUtilization = { audience_id: number; load_count: number };
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
  const [audienceLoad, setAudienceLoad] = useState<AudienceUtilization | null>(null);
  const [weekly, setWeekly] = useState<WeeklyLoad[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

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

  useEffect(() => {
    if (selectedAudience == null) return;
    api<AudienceUtilization>(`/audience-utilization/${selectedAudience}`)
      .then((data) => setAudienceLoad(data))
      .catch(() => setAudienceLoad(null));
  }, [selectedAudience]);

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-100 via-slate-50 to-blue-100 p-10">
      <div className="w-full space-y-10">
        {/* Заголовок */}
        <header className="text-center mb-10">
          <h1 className="text-4xl font-bold text-indigo-700 drop-shadow-sm">
            Аналитический дашборд расписания
          </h1>
          <p className="text-slate-600 mt-2">
            Отслеживайте нагрузку по группам, преподавателям и аудиториям
          </p>
        </header>

        {error && <p className="text-red-600 text-center">{error}</p>}

        {/* Карточки в столбик */}
        <div className="flex flex-col items-center gap-6">
          {/* Общая нагрузка */}
          <Card className="shadow-md bg-white/80 backdrop-blur-sm border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Общее количество пар</CardTitle></CardHeader>
            <CardContent>
              {loading ? <Skeleton className="h-8 w-24" /> : <p className="text-4xl font-semibold text-slate-800">{overall?.total_pairs ?? 0}</p>}
            </CardContent>
          </Card>

          {/* Выбор даты */}
          <Card className="shadow-md bg-white/80 backdrop-blur-sm border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Выбор даты</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <input
                type="date"
                value={selectedDate}
                onChange={(e) => setSelectedDate(e.target.value)}
                className="border border-slate-300 px-3 py-2 rounded-md shadow-sm focus:ring focus:ring-indigo-200"
              />
              <span className="text-slate-700 font-medium">
                {daily ? `${daily.total_pairs} занятий` : "Нет данных по этой дате"}
              </span>
            </CardContent>
          </Card>

          {/* Группа */}
          <Card className="shadow-md bg-white/80 backdrop-blur-sm border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Нагрузка по группе</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <Select value={selectedGroup ? String(selectedGroup) : ""} onValueChange={(v) => setSelectedGroup(Number(v))}>
                <SelectTrigger className="w-64 border-slate-300 bg-white/70">
                  <SelectValue placeholder="Выбрать группу" />
                </SelectTrigger>
                <SelectContent>
                  {groups.map((g) => (
                    <SelectItem key={g.group_id} value={String(g.group_id)}>{g.group_title}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <span className="text-slate-700 font-medium">
                {groupLoad ? `${groupLoad.pairs_count} занятий` : "—"}
              </span>
            </CardContent>
          </Card>

          {/* Преподаватель */}
          <Card className="shadow-md bg-white/80 backdrop-blur-sm border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Нагрузка по преподавателю</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <Select value={selectedTeacher ? String(selectedTeacher) : ""} onValueChange={(v) => setSelectedTeacher(Number(v))}>
                <SelectTrigger className="w-64 border-slate-300 bg-white/70">
                  <SelectValue placeholder="Выбрать преподавателя" />
                </SelectTrigger>
                <SelectContent>
                  {teachers.map((t) => (
                    <SelectItem key={t.teacher_id} value={String(t.teacher_id)}>{t.fio}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <span className="text-slate-700 font-medium">
                {teacherLoad ? `${teacherLoad.pairs_count} занятий у ${teacherLoad.teacher_name}` : "—"}
              </span>
            </CardContent>
          </Card>

          {/* Аудитория */}
          <Card className="shadow-md bg-white/80 backdrop-blur-sm border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700">Загрузка аудитории</CardTitle></CardHeader>
            <CardContent className="flex items-center gap-4">
              <Select value={selectedAudience ? String(selectedAudience) : ""} onValueChange={(v) => setSelectedAudience(Number(v))}>
                <SelectTrigger className="w-64 border-slate-300 bg-white/70">
                  <SelectValue placeholder="Выбрать аудиторию" />
                </SelectTrigger>
                <SelectContent>
                  {audiences.map((a) => (
                    <SelectItem key={a.audience_id} value={String(a.audience_id)}>{a.room}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <span className="text-slate-700 font-medium">
                {audienceLoad ? `${audienceLoad.load_count} занятий` : "—"}
              </span>
            </CardContent>
          </Card>

          {/* График */}
          <Card className="shadow-md bg-white/80 backdrop-blur-sm border border-slate-200 rounded-2xl w-full max-w-4xl">
            <CardHeader><CardTitle className="text-indigo-700 text-center">Загрузка по дням (неделя)</CardTitle></CardHeader>
            <CardContent className="h-[400px]">
              <ResponsiveContainer width="100%" height="100%">
                <LineChart data={weekly}>
                  <CartesianGrid strokeDasharray="3 3" stroke="#d1d5db" />
                  <XAxis dataKey="date" stroke="#4b5563" />
                  <YAxis stroke="#4b5563" />
                  <Tooltip contentStyle={{ backgroundColor: "#f8fafc", borderColor: "#e2e8f0" }} />
                  <Line type="monotone" dataKey="total_pairs" stroke="#6366f1" strokeWidth={2} />
                </LineChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}