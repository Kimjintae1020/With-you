package With.you.example.With.you.Club.Enum;

public enum Category {

    SPORTS("운동"),
    HOBBY("취미"),
    STUDY("스터디"),
    CULTURE("문화"),
    TRAVEL("여행"),
    FOOD("맛집"),
    LANGUAGE("어학"),
    CAREER("직무"),
    OTHER("기타");

    private final String description;

    Category(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
