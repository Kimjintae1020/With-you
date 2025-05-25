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
    VOLUNTEER("봉사"),
    SOCIAL("친목"),
    OTHER("기타");

    private final String description;

    Category(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public static Category fromDescription(String description) {
        for (Category category : Category.values()) {
            if (category.getDescription().equals(description)) {
                return category;
            }
        }
        throw new IllegalArgumentException("잘못된 카테고리 입력: " + description);
    }

}
