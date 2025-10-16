package db
import (
	"log"
	"database/sql"
	_ "github.com/lib/pq"
	"fmt"
)
var db *sql.DB
func Connect() {
	dsn := "postgres://postgres:admin123@db:5432/rasp?sslmode=disable"
	fmt.Println("Connecting to DB:", dsn)
	var err error
	db, err = sql.Open("postgres", dsn)
	if err != nil {
		log.Fatalf("Unable to connect to the database: %v", err)
	}

}