package With.you.example.With.you.Club.Dto;

import With.you.example.With.you.Club.Entity.Club;
import lombok.Getter;

@Getter
public class DtoClubPage {

    private Long clubId;
    private String clubName;         // 동호회 이름
    private String description;      // 동호회 설명
    private String category;         // 카테고리 (운동, 취미, 스터디 등)
    private String region;           // 지역 (서울특별시 등)
    private int maxMembers;          // 최대 인원
    private int currentMembers;      // 현재 인원
    private boolean isPublic;        // 공개 여부
    private String meetingFrequency; // 모임 주기
    private String meetingTime;      // 모임 시간
    private String meetingLocation;  // 활동 장소
    private int dues;                // 회비
    private String leaderNickname;   // 동호회장 닉네임
    private String status;           // 상태 (ACTIVE, INACTIVE)

    public DtoClubPage(Club club) {
        this.clubId = club.getClubId();
        this.clubName = club.getClubName();
        this.description = club.getCategory().getDescription();
        this.category = club.getCategory().getDescription();
        this.region = club.getRegion().getLabel();
        this.maxMembers = club.getMaxMembers();
        this.currentMembers = club.getCurrentMembers();
        this.isPublic = club.isPublic();
        this.meetingFrequency = club.getMeetingFrequency();
        this.meetingTime = club.getMeetingTime();
        this.meetingLocation = club.getMeetingLocation();
        this.dues = club.getDues();
        this.leaderNickname = club.getLeader().getNickname();
        this.status = club.getStatus();
    }
}
