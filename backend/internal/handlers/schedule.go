package handlers


import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/go-chi/chi/v5"
	"Dashboard_Schedule/internal/db"
)

// GetOverallLoadHandler godoc
// @Summary Получение общей загруженности
// @Description Возвращает общее количество пар
// @Tags Статистика
// @Produce json
// @Success 200 {object} models.OverallLoad
// @Router /overall-load [get]
func GetOverallLoadHandler(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	load, err := db.GetOverallLoad(ctx)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(load)
}

// GetGroupLoadHandler godoc
// @Summary Получение загруженности групп
// @Description Возвращает количество пар группы
// @Tags Статистика
// @Produce json
// @Param groupID path int true "ID группы"
// @Success 200 {object} models.GroupLoad
// @Router /group-load/{groupID} [get]
func GetGroupLoadHandler(w http.ResponseWriter, r *http.Request) {
	idStr := chi.URLParam(r, "groupID")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "invalid group ID", http.StatusBadRequest)
		return
	}
	ctx := r.Context()
	load, err := db.GetGroupLoad(ctx, id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(load)
}

// GetTeacherLoadHandler godoc
// @Summary Получение загруженности преподавателя
// @Description Возвращает общее количество пар за семестр у преподавателя
// @Tags Статистика
// @Produce json
// @Success 200 {object} models.TeacherLoad
// @Param teacherID path int true "ID Преподавателя"
// @Router /teacher-load/{teacherID} [get]
func GetTeacherLoadHandler(w http.ResponseWriter, r *http.Request) {
	idStr := chi.URLParam(r, "teacherID")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "invalid teacher ID", http.StatusBadRequest)
		return
	}
	ctx := r.Context()
	load, err := db.GetTeacherLoad(ctx, id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(load)
}

// GetTeacherScheduleHandler godoc
// @Summary Получение расписания преподавателя
// @Tags Расписание
// @Produce json
// @Success 200 {array} models.Lesson
// @Param teacherID path int true "ID Преподавателя"
// @Router /teacher-schedule/{teacherID} [get]
func GetTeacherScheduleHandler(w http.ResponseWriter, r *http.Request) {
	idStr := chi.URLParam(r, "teacherID")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "invalid teacher ID", http.StatusBadRequest)
		return
	}
	ctx := r.Context()
	load, err := db.GetTeacherSchedule(ctx, id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(load)
}
// GetAudienceUtilizationHandler godoc
// @Summary Получение загруженности выбранной аудитории
// @Description Возвращает общее количество пар за семестр в выбранной аудитории
// @Tags Статистика
// @Produce json
// @Success 200 {object} models.AudienceUtilization
// @Param audienceID path int true "ID аудитории"
// @Router /audience-utilization/{audienceID} [get]
func GetAudienceUtilizationHandler(w http.ResponseWriter, r *http.Request) {
	idStr := chi.URLParam(r, "audienceID")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "invalid audience ID", http.StatusBadRequest)
		return
	}
	ctx := r.Context()
	load, err := db.GetAudienceUtilization(ctx, id)
	
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(load)
}
// GetDailyLoadHandler godoc
// @Summary Получение загруженности в выбранную дату
// @Description Возвращает общее количество пар по выбранной дате 
// @Tags Статистика
// @Produce json
// @Success 200 {object} models.DailyLoad
// @Param date path string true "Дата (в формате YYYY-MM-DD)"
// @Router /daily-load/{date} [get]
func GetDailyLoadHandler(w http.ResponseWriter, r *http.Request) {
	date := chi.URLParam(r, "date")
	ctx := r.Context()
	load, err := db.GetDailyLoad(ctx, date)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(load)
}
// GetWeeklyLoadHandler godoc
// @Summary Получение недельной загруженности 
// @Description Возвращает общее количество пар от выбранного дня до начала след. недели
// @Tags Статистика
// @Produce json
// @Success 200 {array} models.DailyLoad
// @Param startDate path string true "Дата первого дня(в формате YYYY-MM-DD)"
// @Router /weekly-load/{startDate} [get]
func GetWeeklyLoadHandler(w http.ResponseWriter, r *http.Request) {
	startDate := chi.URLParam(r, "startDate")
	ctx := r.Context()
	if startDate == "" {
		http.Error(w, "start parameter is required", http.StatusBadRequest)
		return
	}
	weeklyLoad, err := db.GetWeeklyLoad(ctx, startDate)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(weeklyLoad)
}

// GetGroupsHandler godoc
// @Summary Получить список групп
// @Tags Группы
// @Produce json
// @Success 200 {array} models.Group
// @Router /groups [get]
func GetGroupsHandler(w http.ResponseWriter, r *http.Request) {
	groups, err := db.GetGroups(r.Context())
	if err != nil {
		http.Error(w, "Ошибка получения групп", http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	res, err := json.MarshalIndent(groups, "", "  ")
	if err != nil {
		http.Error(w, "Ошибка форматирования JSON", http.StatusInternalServerError)
		return
	}
	w.Write(res)
}
// GetTeachersHandler godoc
// @Summary Получить список преподавателей
// @Tags Преподаватели
// @Produce json
// @Success 200 {array} models.Teacher
// @Router /teachers [get]
func GetTeachersHandler(w http.ResponseWriter, r *http.Request) {
	teachers, err := db.GetTeachers(r.Context())
	if err != nil {
		http.Error(w, "Ошибка получения преподавателей", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	res, err := json.MarshalIndent(teachers, "", "  ")
	if err != nil {
		http.Error(w, "Ошибка форматирования JSON", http.StatusInternalServerError)
		return
	}
	w.Write(res)
}
// GetAudienceHandler godoc
// @Summary Получить список аудиторий
// @Tags Аудитории
// @Produce json
// @Success 200 {array} models.Audience
// @Router /audiences [get]
func GetAudiencesHandler(w http.ResponseWriter, r *http.Request) {
	audiences, err := db.GetAudiences(r.Context())
	if err != nil {
		http.Error(w, "Ошибка получения преподавателей", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	res, err := json.MarshalIndent(audiences, "", "  ")
	if err != nil {
		http.Error(w, "Ошибка форматирования JSON", http.StatusInternalServerError)
		return
	}
	w.Write(res)
}