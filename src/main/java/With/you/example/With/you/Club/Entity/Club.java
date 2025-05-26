package With.you.example.With.you.Club.Entity;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Club.Enum.Category;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "CLUB")
public class Club {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CLUB_ID")
    private Long clubId;

    @Column(name = "CLUB_NAME", nullable = false, unique = true)
    private String clubName;           // 동호회 이름

    @Column(name = "DESCRIPTION", nullable = false, length = 1000)
    private String description;        // 동호회 소개/설명

    @Enumerated(EnumType.STRING)
    @Column(name = "CATEGORY", nullable = false)
    private Category category;         // 동호회 카테고리

    @Enumerated(EnumType.STRING)
    @Column(name = "REGION", nullable = false)
    private Region region;             // 활동 지역

    @Column(name = "MAX_MEMBERS", nullable = false)
    private int maxMembers;           // 최대 인원 수

    @Column(name = "CURRENT_MEMBERS", nullable = false)
    private int currentMembers;       // 현재 인원 수

    @Column(name = "IS_PUBLIC", nullable = false)
    private boolean isPublic;         // 공개/비공개 여부

    @Column(name = "MEETING_FREQUENCY", nullable = false)
    private String meetingFrequency;  // 모임 주기

    @Column(name = "MEETING_TIME")
    private String meetingTime;       // 모임 시간

    @Column(name = "MEETING_LOCATION", nullable = false)
    private String meetingLocation;   // 주요 활동 장소

    @Column(name = "DUES")
    private int dues;                 // 회비

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LEADER_ID", nullable = false)
    private Account leader;           // 동호회장

    @Column(name = "STATUS", nullable = false)
    private String status;            // 동호회 상태 (ACTIVE, INACTIVE)

    @CreatedDate
    @Column(name = "CREATED_AT", nullable = false, updatable = false)
    private LocalDateTime createdAt;  // 생성일시

    @LastModifiedDate
    @Column(name = "UPDATED_AT", nullable = false)
    private LocalDateTime updatedAt;  // 수정일시

    @Builder
    public Club(String clubName, String description, Category category, Region region,
                int maxMembers, int currentMembers, boolean isPublic,
                String meetingFrequency, String meetingTime, String meetingLocation,
                int dues, Account leader, String status) {
        this.clubName = clubName;
        this.description = description;
        this.category = category;
        this.region = region;
        this.maxMembers = maxMembers;
        this.currentMembers = currentMembers;
        this.isPublic = isPublic;
        this.meetingFrequency = meetingFrequency;
        this.meetingTime = meetingTime;
        this.meetingLocation = meetingLocation;
        this.dues = dues;
        this.leader = leader;
        this.status = status;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    public void updateStatus(String newStatus) {
        this.status = newStatus;
        this.updatedAt = LocalDateTime.now();
    }

}