package models

type OverallLoad struct {
	TotalPairs int `json:"total_pairs"`
}

type GroupLoad struct {
	GroupTitle string `json:"group_title"`
	PairsCount int    `json:"pairs_count"`
}

type TeacherLoad struct {
	TeacherName string `json:"teacher_name"`
	PairsCount  int    `json:"pairs_count"`
}
type Lesson struct {
	Date       string `json:"date"`
	Time       string `json:"time"`
	Subject    string `json:"subject"`
	Teacher    string `json:"teacher"`
	Group      string `json:"group"`
	Audience   string    `json:"audience"`
}
type AudienceUtilization struct {
	AudienceID int    `json:"audience_id"`
	Room       string `json:"room"`
	LoadCount  int    `json:"load_count"`
}
type DailyLoad struct {
	Date       string `json:"date"`
	TotalPairs int    `json:"total_pairs"`
}
type Group struct {
	ID int `json:"group_id"`
	Title string `json:"group_title"`
}
type Teacher struct {
	ID int `json:"teacher_id"`
	FIO string `json:"fio"`
}
type Audience struct {
	ID int `json:"audience_id"`
	Room string `json:"room"`
}
