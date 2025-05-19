package With.you.example.With.you.Club.Enum;

public enum ClubMemberStatus {
    ACTIVE("활성"),
    INACTIVE("비활성"),
    BANNED("차단됨");

    private final String description;

    ClubMemberStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}

