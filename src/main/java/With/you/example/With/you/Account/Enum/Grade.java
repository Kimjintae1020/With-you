package With.you.example.With.you.Account.Enum;

import lombok.Getter;

@Getter
public enum Grade {

    SEED("🌱 Seed", "새싹 유저"),
    SPROUT("🌿 Sprout", "활동을 시작한 유저"),
    TREE("🌳 Tree", "지역 커뮤니티의 뿌리"),
    BLOOM("🌸 Bloom", "활짝 피어난 유저"),
    SUN("🌟 Sun", "모든 걸 비추는 전설 유저");

    private final String displayName; // 아이콘 + 영문
    private final String description; // 설명

    Grade(String displayName, String description) {
        this.displayName = displayName;
        this.description = description;
    }
}