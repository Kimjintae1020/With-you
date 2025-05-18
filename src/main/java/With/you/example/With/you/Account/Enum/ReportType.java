package With.you.example.With.you.Account.Enum;

public enum ReportType {
    INAPPROPRIATE_BEHAVIOR("부적절한 행동"),
    HARASSMENT("괴롭힘"),
    SPAM("스팸"),
    FAKE_ACCOUNT("가짜 계정"),
    OFFENSIVE_LANGUAGE("공격적인 언어 사용"),
    OTHER("기타");

    private final String description;

    ReportType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
