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
// @Success 200 {object} models.GroupLoad
// @Router /group-load/{group.id} [get]
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
func GetGroupScheduleHandler(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "groupID"))
	data, _ := db.GetGroupSchedule(r.Context(), id)
	json.NewEncoder(w).Encode(data)
}
func GetTeacherScheduleHandler(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "teacherID"))
	data, _ := db.GetTeacherSchedule(r.Context(), id)
	json.NewEncoder(w).Encode(data)
}
func GetAudienceUtilizationHandler(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "audienceID"))
	data, _ := db.GetAudienceUtilization(r.Context(), id)
	json.NewEncoder(w).Encode(data)
}
func GetDailyLoadHandler(w http.ResponseWriter, r *http.Request) {
	date := chi.URLParam(r, "date")
	data, _ := db.GetDailyLoad(r.Context(), date)
	json.NewEncoder(w).Encode(data)
}
func GetWeeklyLoadHandler(w http.ResponseWriter, r *http.Request) {
	start := r.URL.Query().Get("start")
	data, _ := db.GetWeeklyLoad(r.Context(), start)
	json.NewEncoder(w).Encode(data)
}
func GetTeacherAvailabilityHandler(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(chi.URLParam(r, "teacherID"))
	date := r.URL.Query().Get("date")
	data, _ := db.GetTeacherAvailability(r.Context(), id, date)
	json.NewEncoder(w).Encode(data)
}
// GetGroupsHandler godoc
// @Summary Получить список групп
// @Tags groups
// @Produce json
// @Success 200 {array} models.Group
// @Router /groups [get]
func GetGroupsHandler(w http.ResponseWriter, r *http.Request) {
	data, _ := db.GetGroups(r.Context())
	json.NewEncoder(w).Encode(data)
}

func GetTeachersHandler(w http.ResponseWriter, r *http.Request) {
	data, _ := db.GetTeachers(r.Context())
	json.NewEncoder(w).Encode(data)
}

func GetAudiencesHandler(w http.ResponseWriter, r *http.Request) {
	data, _ := db.GetAudiences(r.Context())
	json.NewEncoder(w).Encode(data)
}