package db

import (
	"Dashboard_Schedule/internal/models"
	"context"
)

// Общая нагрузка по всем группам
func GetOverallLoad(ctx context.Context) (models.OverallLoad, error) {
	query := `SELECT COUNT(*) AS total_pairs FROM sc_rasp18`
	var load models.OverallLoad
	row := db.QueryRowContext(ctx, query)
	err := row.Scan(&load.TotalPairs)
	return load, err
}

// Нагрузка для выбранной группы
func GetGroupLoad(ctx context.Context, groupID int) (models.GroupLoad, error) {
	query := `
	SELECT g.title, COUNT(r.id) AS pairs_count
	FROM sc_group g
	JOIN sc_rasp18_groups rg ON g.id = rg.group_id
	JOIN sc_rasp18 r ON rg.rasp18_id = r.id
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
	SELECT p.fio, COUNT(r.id) AS pairs_count
	FROM sc_prep p
	JOIN sc_rasp18_preps rp ON p.id = rp.prep_id
	JOIN sc_rasp18 r ON rp.rasp18_id = r.id
	WHERE p.id = $1
	GROUP BY p.fio;
	`
	var load models.TeacherLoad
	row := db.QueryRowContext(ctx, query, teacherID)
	err := row.Scan(&load.TeacherName, &load.PairsCount)
	return load, err
}
// Расписание для группы
func GetGroupSchedule(ctx context.Context, groupID int) ([]models.Lesson, error) {
	query := `
	SELECT 
		to_char(d.day, 'YYYY-MM-DD') AS date,
		r.timestart AS time,
		disc.shorttitle AS subject,
		p.fio AS teacher,
		g.title AS group,
		rr.room AS audience
	FROM sc_rasp18 r
	JOIN sc_rasp18_groups rg ON r.id = rg.rasp18_id
	JOIN sc_group g ON rg.group_id = g.id
	JOIN sc_rasp18_days d ON r.day_id = d.id
	JOIN sc_disc disc ON r.disc_id = disc.id
	LEFT JOIN sc_rasp18_preps rp ON r.id = rp.rasp18_id
	LEFT JOIN sc_prep p ON rp.prep_id = p.id
	LEFT JOIN sc_rasp18_rooms rr ON r.id = rr.rasp18_id
	WHERE g.id = $1
	ORDER BY d.day, r.timestart;
	`
	
	rows, err := db.QueryContext(ctx, query, groupID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var schedule []models.Lesson
	for rows.Next() {
		var lesson models.Lesson
		err := rows.Scan(
			&lesson.Date,
			&lesson.Time,
			&lesson.Subject,
			&lesson.Teacher,
			&lesson.Group,
			&lesson.Audience,
		)
		if err != nil {
			return nil, err
		}
		schedule = append(schedule, lesson)
	}
	
	return schedule, nil
}

// Расписание преподавателя
func GetTeacherSchedule(ctx context.Context, teacherID int) ([]models.Lesson, error) {
	query := `
		SELECT 
		to_char(d.day, 'YYYY-MM-DD') AS date,
		r.timestart AS time,
		disc.shorttitle AS subject,
		p.fio AS teacher,
		g.title AS group,
		rr.room AS audience
	FROM sc_rasp18 r
	JOIN sc_rasp18_preps rp ON r.id = rp.rasp18_id
	JOIN sc_prep p ON rp.prep_id = p.id
	JOIN sc_rasp18_days d ON r.day_id = d.id
	JOIN sc_disc disc ON r.disc_id = disc.id
	LEFT JOIN sc_rasp18_groups rg ON r.id = rg.rasp18_id
	LEFT JOIN sc_group g ON rg.group_id = g.id
	LEFT JOIN sc_rasp18_rooms rr ON r.id = rr.rasp18_id
	WHERE p.id = $1
	ORDER BY d.day, r.timestart;
	`
	rows, err := db.QueryContext(ctx, query, teacherID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	
	var schedule []models.Lesson
	for rows.Next() {
		var lesson models.Lesson
		err := rows.Scan(
			&lesson.Date,
			&lesson.Time,
			&lesson.Subject,
			&lesson.Teacher,
			&lesson.Group,
			&lesson.Audience,
		)
		if err != nil {
			return nil, err
		}
		schedule = append(schedule, lesson)
	}
	
	return schedule, nil
}

// Нагрузка аудитории
func GetAudienceUtilization(ctx context.Context, audienceID int) (models.AudienceUtilization, error) {
	query := `
	SELECT 
		rr.id AS audience_id,
		rr.room AS room,
		COUNT(r.id) AS load_count
	FROM sc_rasp18 r
	JOIN sc_rasp18_rooms rr ON r.id = rr.rasp18_id
	WHERE rr.id = $1
    GROUP BY rr.id;`
	var load models.AudienceUtilization
	row := db.QueryRowContext(ctx, query, audienceID)
	err := row.Scan(&load.AudienceID, &load.Room, &load.LoadCount)
	return load, err
}

// Общая нагрузка в определённый день
func GetDailyLoad(ctx context.Context, date string) (models.DailyLoad, error) {
	query := `
	SELECT 
		$1::text AS date,
		COUNT(r.id) AS total_pairs
	FROM sc_rasp18 r
	JOIN sc_rasp18_days d ON r.day_id = d.id
	WHERE d.day = $1::date
	GROUP BY $1::text;`
	var load models.DailyLoad
	row := db.QueryRowContext(ctx, query, date)
	err := row.Scan(&load.Date, &load.TotalPairs)
	return load, err
}

// Общая нагрузка в неделю
func GetWeeklyLoad(ctx context.Context, startDate string) ([]models.DailyLoad, error) {
	query := `
	SELECT 
		to_char(d.day, 'YYYY-MM-DD') AS date,
		COUNT(r.id) AS total_pairs
	FROM sc_rasp18_days d
	LEFT JOIN sc_rasp18 r ON d.id = r.day_id
	WHERE d.day BETWEEN $1::date AND $1::date + interval '6 days'
	GROUP BY d.day
	ORDER BY d.day;
	`
	rows, err := db.QueryContext(ctx, query, startDate)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var weeklyLoad []models.DailyLoad
	for rows.Next() {
		var dl models.DailyLoad
		err := rows.Scan(&dl.Date, &dl.TotalPairs)
		if err != nil {
			return nil, err
		}
		weeklyLoad = append(weeklyLoad, dl)
	}
	
	return weeklyLoad, nil
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
	query := `SELECT DISTINCT room FROM sc_rasp18_rooms ORDER BY room;`
	
	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var audiences []models.Audience
	id := 1
	for rows.Next() {
		var room string
		err := rows.Scan(&room)
		if err != nil {
			return nil, err
		}
		audiences = append(audiences, models.Audience{ID: id, Room: room})
		id++
	}
	
	return audiences, nil
}
