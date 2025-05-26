package With.you.example.With.you.Club.Dto;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Club.Enum.Category;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import java.time.format.DateTimeFormatter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Builder
@AllArgsConstructor
public class DtoClubDetail {

    private Long clubId;
    private String clubName;
    private String description;
    private String category;
    private String region;
    private int maxMembers;
    private int currentMembers;
    private boolean isPublic;
    private String meetingFrequency;
    private String meetingTime;
    private String meetingLocation;
    private int dues;
    private String leaderNickname;
    private String leaderAccountName;
    private String status;
    private String createdAt;
    private String updatedAt;

    private boolean isJoined;  // 내가 가입했는지 여부
    private List<DtoClubMember> members;  // 멤버 목록

    public DtoClubDetail(Long clubId, String clubName, String description, Category category, Region region,
                         int maxMembers, int currentMembers, boolean isPublic, String meetingFrequency,
                         String meetingTime, String meetingLocation, int dues, Account leader,
                         String status, LocalDateTime createdAt, LocalDateTime updatedAt) {

        this.clubId = clubId;
        this.clubName = clubName;
        this.description = description;
        this.category = category != null ? category.getDescription() : null;
        this.region = region != null ? region.getLabel() : null;
        this.maxMembers = maxMembers;
        this.currentMembers = currentMembers;
        this.isPublic = isPublic;
        this.meetingFrequency = meetingFrequency;
        this.meetingTime = meetingTime;
        this.meetingLocation = meetingLocation;
        this.dues = dues;
        this.leaderNickname = leader != null ? leader.getNickname() : null;
        this.leaderAccountName = leader != null ? leader.getAccountname() : null;
        this.status = status;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        this.createdAt = createdAt != null ? createdAt.format(formatter) : null;
        this.updatedAt = updatedAt != null ? updatedAt.format(formatter) : null;
    }

}