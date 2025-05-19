package With.you.example.With.you.Club.Dto;

import With.you.example.With.you.Club.Enum.Category;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DtoCreateClub {

    private String clubName;           // 동호회 이름
    private String description;        // 동호회 소개/설명
    private Category category;           // 동호회 카테고리 (운동, 취미, 스터디 등)
    private String region;             // 활동 지역

    private int maxMembers;           // 최대 인원 수

    private boolean isPublic;         // 공개/비공개 여부

    private String meetingFrequency;  // 모임 주기 (주 1회, 월 2회 등)
    private String meetingTime;       // 모임 시간
    private String meetingLocation;   // 주요 활동 장소

    private int dues;                 // 회비

}
