// @title Dashboard Schedule API
// @version 1.0
// @description API для анализатора дашборд расписания.
// @host localhost:8080
// @BasePath /

package main

import (

    "Dashboard_Schedule/internal/db"
    "Dashboard_Schedule/internal/handlers"

    "github.com/go-chi/chi/v5/middleware"
    "github.com/go-chi/chi/v5"
    "log"
    "net/http"
    "os"

    httpSwagger "github.com/swaggo/http-swagger"
    _ "Dashboard_Schedule/internal/docs" 
)


func main() {
    db.Connect()
    r := chi.NewRouter()
    r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)
  

    r.Get("/swagger/*", httpSwagger.WrapHandler)

   
    r.Get("/overall-load", handlers.GetOverallLoadHandler) // +

 
	r.Get("/group-load/{groupID}", handlers.GetGroupLoadHandler) // + 

	
    r.Get("/teacher-load/{teacherID}", handlers.GetTeacherLoadHandler) // +

	
    r.Get("/teacher-schedule/{teacherID}", handlers.GetTeacherScheduleHandler) 
    

	r.Get("/audience-utilization/{audienceID}", handlers.GetAudienceUtilizationHandler) // +
	r.Get("/daily-load/{date}", handlers.GetDailyLoadHandler) // +
	r.Get("/weekly-load/{startDate}", handlers.GetWeeklyLoadHandler) // +

    
    r.Get("/groups", handlers.GetGroupsHandler) // +
    r.Get("/teachers", handlers.GetTeachersHandler) // +
    r.Get("/audiences", handlers.GetAudiencesHandler) // +
    
    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    log.Printf("Server started at :%s", port)
    http.ListenAndServe(":"+port, r)
}
