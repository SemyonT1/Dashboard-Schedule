package main

import (
    "Dashboard_Schedule/internal/db"
    "Dashboard_Schedule/internal/handlers"

    "github.com/go-chi/chi/v5"
    "github.com/rs/cors"
    "log"
    "net/http"
    "os"
)

func main() {
    db.Connect()
    r := chi.NewRouter()
    handler := cors.New(cors.Options {
    AllowedOrigins:   []string{"*"},
    AllowCredentials: true,
    AllowedHeaders:   []string{"*"},
    AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
    }).Handler(r)

   

    r.Get("/overall-load", handlers.GetOverallLoadHandler) // +
	r.Get("/group-load/{groupID}", handlers.GetGroupLoadHandler) // + 
	r.Get("/teacher-load/{teacherID}", handlers.GetTeacherLoadHandler) // +
	r.Get("/group-schedule/{groupID}", handlers.GetGroupScheduleHandler) // -
	r.Get("/teacher-schedule/{teacherID}", handlers.GetTeacherScheduleHandler) // +
	r.Get("/audience-utilization/{audienceID}", handlers.GetAudienceUtilizationHandler) // -
	r.Get("/daily-load/{date}", handlers.GetDailyLoadHandler) // -
	r.Get("/weekly-load", handlers.GetWeeklyLoadHandler) // -
    r.Get("/groups", handlers.GetGroupsHandler) // +
    r.Get("/teachers", handlers.GetTeachersHandler) // +
    r.Get("/audiences", handlers.GetAudiencesHandler) // +
    
    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    log.Printf("Server started at :%s", port)
    http.ListenAndServe(":"+port, handler)
}
