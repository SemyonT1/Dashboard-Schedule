package db

import (
	"Dashboard_Schedule/internal/models"
	"context"
)

// Общая нагрузка по всем группам
func GetOverallLoad(ctx context.Context) (models.OverallLoad, error) {
	query := `
	SELECT COUNT(*) AS total_pairs
	FROM sc_rasp7_groups rg
	JOIN sc_rasp7 r ON rg.rasp7_id = r.id;
	`
	var load models.OverallLoad
	row := db.QueryRowContext(ctx, query)
	err := row.Scan(&load.TotalPairs)
	return load, err
}

// Нагрузка для выбранной группы
func GetGroupLoad(ctx context.Context, groupID int) (models.GroupLoad, error) {
	query := `
	SELECT g.title, COUNT(*) AS pairs_count
	FROM sc_group g
	JOIN sc_rasp7_groups rg ON g.id = rg.group_id
	WHERE g.id = $1
	GROUP BY g.title;
	`
	var load models.GroupLoad
	row := db.QueryRowContext(ctx, query, groupID)
	err := row.Scan(&load.GroupTitle, &load.PairsCount)
	return load, err
}

// Нагрузка у выбранного преподавателя
func GetTeacherLoad(ctx context.Context, teacherID int) (models.TeacherLoad, error) {
	query := `
	SELECT p.fio, COUNT(*) AS pairs_count
	FROM sc_prep p
	JOIN sc_rasp7_preps rp ON p.id = rp.prep_id
	WHERE p.id = $1
	GROUP BY p.fio;
	`
	var load models.TeacherLoad
	row := db.QueryRowContext(ctx, query, teacherID)
	err := row.Scan(&load.TeacherName, &load.PairsCount)
	return load, err
}
// Расписание для группы
func GetGroupSchedule(ctx context.Context, groupID int) (models.Lesson, error) {
	query := 
	`SELECT fields FROM sc_rasp7 r
	JOIN sc_rasp7_groups rg ON r.id = rg.rasp7_id
	JOIN sc_group g ON g.id = rg.group_id
	WHERE g.id = $1 ORDER BY r.weekday, r.time
	`
	var load models.Lesson
	row := db.QueryRowContext(ctx, query, groupID)
	err := row.Scan(&load.Group, &load.Subject, &load.Teacher, &load.Date, &load.Time, &load.AudienceID)
	return load, err
}

// Расписание преподавателя
func GetTeacherSchedule(ctx context.Context, teacherID int) ([]models.Lesson, error) {
	query := `
		SELECT d.day, d.weekday, disc.title, g.title, r.room_id, p.fio
		FROM sc_rasp18 rasp
		JOIN sc_rasp18_preps rp ON rp.rasp18_id = rasp.id
		JOIN sc_rasp18_groups rg ON rg.rasp18_id = rasp.id
		JOIN sc_group g ON g.id = rg.group_id
		JOIN sc_disc disc ON disc.id = rasp.disc_id
		JOIN sc_days d ON d.id = rasp.day_id
		JOIN sc_prep p ON p.id = rp.prep_id
		WHERE p.id = $1
		ORDER BY d.day, d.weekday
	`
	rows, err := db.QueryContext(ctx, query, teacherID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var lessons []models.Lesson
	for rows.Next() {
		var lesson models.Lesson
		err := rows.Scan(&lesson.Date, &lesson.Time, &lesson.Subject, &lesson.Group, &lesson.AudienceID, &lesson.Teacher)
		if err != nil {
			return nil, err
		}
		lessons = append(lessons, lesson)
	}
	return lessons, nil
}

// Нагрузка аудитории
func GetAudienceUtilization(ctx context.Context, audienceID int) (models.AudienceUtilization, error) {
	query := `SELECT r.audience_id, COUNT(*) FROM sc_rasp7 r WHERE r.audience_id = $1 
			  GROUP BY r.audience_id"`
	var load models.AudienceUtilization
	row := db.QueryRowContext(ctx, query, audienceID)
	err := row.Scan(&load.AudienceID, &load.LoadCount)
	return load, err
}

// Общая нагрузка в определённый день
func GetDailyLoad(ctx context.Context, date string) (models.DailyLoad, error) {
	query := "SELECT COUNT(*) FROM sc_rasp7 r WHERE r.weekday = $1"
	var load models.DailyLoad
	row := db.QueryRowContext(ctx, query)
	err := row.Scan(&load.Date, &load.TotalPairs)
	return load, err
}

// Общая нагрузка в неделю
func GetWeeklyLoad(ctx context.Context, weekStart string) ([]models.DailyLoad, error) {
	query := `
		SELECT d.day, COUNT(*)
		FROM sc_rasp18 r
		JOIN sc_days d ON r.day_id = d.id
		WHERE d.day >= $1::day AND d.day < $1::day + interval '7 days'
		GROUP BY d.day
		ORDER BY d.day
	`
	rows, err := db.QueryContext(ctx, query, weekStart)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var loads []models.DailyLoad
	for rows.Next() {
		var load models.DailyLoad
		err := rows.Scan(&load.Date, &load.TotalPairs)
		if err != nil {
			return nil, err
		}
		loads = append(loads, load)
	}
	return loads, nil
}

// Свободные окна для преподавателя в определённый день
func GetTeacherAvailability(ctx context.Context, teacherID int, date string) ([]models.TimeSlot, error) {
	query := `
		SELECT t.time
		FROM sc_times t
		EXCEPT
		SELECT d.weekday
		FROM sc_rasp18 r
		JOIN sc_days d ON r.day_id = d.id
		JOIN sc_rasp18_preps rp ON rp.rasp18_id = r.id
		WHERE d.day = $1 AND rp.prep_id = $2
		ORDER BY t.time;
	`
	rows, err := db.QueryContext(ctx, query, teacherID, date)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var slots []models.TimeSlot
	for rows.Next() {
		var slot models.TimeSlot
		err := rows.Scan(&slot.StartTime)
		if err != nil {
			return nil, err
		}
		slots = append(slots, slot)
	}
	return slots, nil
}
func GetGroups(ctx context.Context) ([]models.Group, error) {
	rows, err := db.QueryContext(ctx, "SELECT id, title FROM sc_group ORDER BY title")
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var groups []models.Group
	for rows.Next() {
		var g models.Group
		err := rows.Scan(&g.ID, &g.Title)
		if err != nil {
		return nil, err
		}
		groups = append(groups, g)
	}
	return groups, nil
}
func GetTeachers(ctx context.Context) ([]models.Teacher, error) {
	rows, err := db.QueryContext(ctx, "SELECT id, fio FROM sc_prep ORDER BY fio")
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var teachers []models.Teacher
	for rows.Next() {
		var t models.Teacher
		err := rows.Scan(&t.ID, &t.FIO)
		if err != nil {
			return nil, err
		}
		teachers = append(teachers, t)
	}
	return teachers, nil
}
func GetAudiences(ctx context.Context) ([]models.Audience, error) {
	rows, err := db.QueryContext(ctx, "SELECT id, room FROM sc_rasp18_rooms ORDER BY room")
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var audiences []models.Audience
	for rows.Next() {
		var t models.Audience
		err := rows.Scan(&t.ID, &t.Room)
		if err != nil {
			return nil, err
		}
		audiences = append(audiences, t)
	}
	return audiences, nil
}
