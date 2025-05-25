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
	AudienceID int    `json:"audience_id"`
}
type AudienceUtilization struct {
	AudienceID int `json:"audience_id"`
	LoadCount  int `json:"load_count"`
}
type DailyLoad struct {
	Date       string `json:"date"`
	TotalPairs int    `json:"total_pairs"`
}
type TimeSlot struct {
	StartTime string `json:"start_time"`
	EndTime   string `json:"end_time"`
}
