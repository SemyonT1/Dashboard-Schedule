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
	WHERE g.id = $1 ORDER BY r.date, r.time
	`
	var load models.Lesson
	row := db.QueryRowContext(ctx, query, groupID)
	err := row.Scan(&load.Group, &load.Subject, &load.Teacher, &load.Date, &load.Time, &load.AudienceID)
	return load, err
}

// Расписание преподавателя
func GetTeacherSchedule(ctx context.Context, teacherID int) ([]models.Lesson, error) {
	// Similar join on sc_rasp7_preps
	return nil, nil
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
	query := "SELECT COUNT(*) FROM sc_rasp7 r WHERE r.date = $1"
	var load models.DailyLoad
	row := db.QueryRowContext(ctx, query)
	err := row.Scan(&load.Date, &load.TotalPairs)
	return load, err
}

// Общая нагрузка в неделю
func GetWeeklyLoad(ctx context.Context, weekStart string) ([]models.DailyLoad, error) {
	// Loop days or use generate_series for date between $1 and $1 + 6
	return nil, nil
}

// Свободные окна для преподавателя в определённый день
func GetTeacherAvailability(ctx context.Context, teacherID int, date string) ([]models.TimeSlot, error) {
	// Query slots not occupied by teacher
	return nil, nil
}
