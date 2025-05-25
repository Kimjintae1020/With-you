package With.you.example.With.you.Club.Dto;

import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Club.Enum.Category;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
public class ClubListResponse {
    private Long clubId;
    private String clubName;
    private Category category;
    private Region region;
    private int currentMembers;
    private int maxMembers;
    private String leaderNickname;
    private String meetingFrequency;
    private String meetingLocation;
    private boolean isMember;        // 현재 사용자가 멤버인지 여부
    private boolean isLeader;        // 현재 사용자가 리더인지 여부
    private LocalDateTime createdAt;
}