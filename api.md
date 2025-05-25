#  API для Dashboard Расписания

Все эндпойнты работают на сервере Go через HTTP (`localhost:8080` в Docker).

---

##  1. Получить общее количество пар (нагрузка)

**GET** `/overall-load`

 Возвращает общее количество пар на основе таблицы `sc_rasp18`.

 Ответ:

```json
{
  "total_pairs": 672
}
```

---

##  2. Нагрузка по группе

**GET** `/group-load/{groupID}`

 Параметры:

* `groupID`: ID группы

 Считает пары из `sc_rasp18` через связь `sc_rasp18_groups`.

 Ответ:

```json
{
  "group_title": "КМБО-05-23",
  "pairs_count": 32
}
```

---

##  3. Нагрузка по преподавателю

**GET** `/teacher-load/{teacherID}`

 Параметры:

* `teacherID`: ID преподавателя

 Считает пары по `sc_rasp18_preps`.

 Ответ:

```json
{
  "teacher_name": "Качалов С.К",
  "pairs_count": 48
}
```

---

##  4. Расписание группы

**GET** `/group-schedule/{groupID}`

 Параметры:

* `groupID`: ID группы

 Расписание из `sc_rasp18`, связь через `sc_rasp18_groups`, дата берётся из `sc_days`, дисциплина — из `sc_disc`, преподаватель — из `sc_rasp18_preps`.

 Ответ:

```json
[
  {
    "date": "2025-09-15",
    "time": "10:00",
    "subject": "Алгебра и Геометрия",
    "teacher": "Воловиков А.Ю.",
    "group": "КМБО-05-23",
    "audience_id": 12
  }
]
```

---

##  5. Расписание преподавателя

**GET** `/teacher-schedule/{teacherID}`

 Параметры:

* `teacherID`: ID преподавателя

 Расписание из `sc_rasp18`, связь через `sc_rasp18_preps`, дни — `sc_days`, дисциплина — `sc_disc`, группы — через `sc_rasp18_groups` → `sc_group`.

 Ответ: массив занятий в формате, как выше.

---

##  6. Нагрузка за неделю

**GET** `/weekly-load?start=YYYY-MM-DD`

 Подсчёт пар в `sc_rasp18`, по `sc_days.date` начиная с указанной даты и на 7 дней вперёд.

 Ответ:

```json
[
  { "date": "2025-09-15", "total_pairs": 8 },
  { "date": "2025-09-16", "total_pairs": 10 }
]
```

---

##  7. Свободные окна преподавателя

**GET** `/teacher-availability/{teacherID}/{date}`

 Параметры:

* `teacherID`: ID преподавателя
* `date`: дата `YYYY-MM-DD`

 Вычисляется как: все возможные времена из `sc_times` минус те, где у преподавателя есть пары (`sc_rasp18` + `sc_rasp18_preps`), дата через `sc_days`.

🔁 Ответ:

```json
[
  { "start_time": "08:00" },
  { "start_time": "14:00" }
]
```

---

##  8. Загрузка аудитории

**GET** `/audience-utilization/{audienceID}`

🔢 Параметры:

* `audienceID`: ID аудитории

 Считается количество записей в `sc_rasp18` с указанной `room_id`, таблица аудиторий — `sc_rasp18_rooms`.

 Ответ:

```json
{
  "audience_id": 5,
  "load_count": 27
}
```

---

##  9. Нагрузка на конкретный день

**GET** `/daily-load/{date}`

 Параметры:

* `date`: `YYYY-MM-DD`

 Считается количество строк в `sc_rasp18`, где день совпадает с `sc_days.date = ?`.

 Ответ:

```json
{
  "date": "2025-09-15",
  "total_pairs": 11
}
```

---

##  10. Получить список групп

**GET** `/groups`

 Ответ:

```json
[
  { "id": 1, "title": "КМБО-21-24" },
  { "id": 2, "title": "КМБО-22-24" }
]
```

---

## 11. Получить список преподавателей

**GET** `/teachers`

 Ответ:

```json
[
  { "id": 1, "fio": "Черноусов Д.И." },
  { "id": 2, "fio": "Хачлаев Т.С." }
]
```

---

##  12. Получить список аудиторий

**GET** `/audiences`

 Ответ:

```json
[
  { "id": 1, "room": "А-13" },
  { "id": 2, "room": "А-174" }
]
```

---

>  Все даты должны быть в формате `YYYY-MM-DD`  Все ID должны быть целыми числами


