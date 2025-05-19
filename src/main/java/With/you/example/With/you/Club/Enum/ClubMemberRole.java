package With.you.example.With.you.Club.Enum;

public enum ClubMemberRole {
    LEADER("동호회장"),
    MEMBER("회원");

    private final String description;

    ClubMemberRole(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}

