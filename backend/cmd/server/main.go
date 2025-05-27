package main

import (
    "Dashboard_Schedule/internal/db"
    "Dashboard_Schedule/internal/handlers"

    "github.com/go-chi/chi/v5"

    "log"
    "net/http"
    "os"
)

func main() {
    db.Connect()
    r := chi.NewRouter()

    r.Get("/overall-load", handlers.GetOverallLoadHandler) // норм
	r.Get("/group-load/{groupID}", handlers.GetGroupLoadHandler) // норм
	r.Get("/teacher-load/{teacherID}", handlers.GetTeacherLoadHandler) //норм
	r.Get("/group-schedule/{groupID}", handlers.GetGroupScheduleHandler) // хуета
	r.Get("/teacher-schedule/{teacherID}", handlers.GetTeacherScheduleHandler) // хуета
	r.Get("/audience-utilization/{audienceID}", handlers.GetAudienceUtilizationHandler) // хуета
	r.Get("/daily-load/{date}", handlers.GetDailyLoadHandler) // хуета
	r.Get("/weekly-load", handlers.GetWeeklyLoadHandler) // хуета
    r.Get("/groups", handlers.GetGroupsHandler) // норм
    r.Get("/teachers", handlers.GetTeachersHandler) // норм
    r.Get("/audiences", handlers.GetAudiencesHandler) // норм
    port := os.Getenv("PORT")
	
    if port == "" {
        port = "8080"
    }
    log.Printf("Server started at :%s", port)
    http.ListenAndServe(":"+port, r)
}
