package With.you.example.With.you.Club.Entity;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Club.Enum.ClubMemberRole;
import With.you.example.With.you.Club.Enum.ClubMemberStatus;
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
@Table(name = "CLUB_MEMBERS")
public class ClubMember {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CLUB_MEMBER_ID")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CLUB_ID", nullable = false)
    private Club club;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ACCOUNT_ID", nullable = false)
    private Account account;

    @Column(name = "ROLE", nullable = false)
    @Enumerated(EnumType.STRING)
    private ClubMemberRole role;  // LEADER, MEMBER

    @Column(name = "JOINED_AT", nullable = false)
    private LocalDateTime joinedAt;

    @Column(name = "STATUS", nullable = false)
    @Enumerated(EnumType.STRING)
    private ClubMemberStatus status;  // ACTIVE, INACTIVE

    @CreatedDate
    @Column(name = "CREATED_AT", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "UPDATED_AT", nullable = false)
    private LocalDateTime updatedAt;

    @Builder
    public ClubMember(Club club, Account account, ClubMemberRole role,
                      LocalDateTime joinedAt, ClubMemberStatus status) {
        this.club = club;
        this.account = account;
        this.role = role;
        this.joinedAt = joinedAt;
        this.status = status;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    // 비즈니스 메서드
    public void updateRole(ClubMemberRole newRole) {
        this.role = newRole;
        this.updatedAt = LocalDateTime.now();
    }

    public void updateStatus(ClubMemberStatus newStatus) {
        this.status = newStatus;
        this.updatedAt = LocalDateTime.now();
    }

    public boolean isLeader() {
        return this.role == ClubMemberRole.LEADER;
    }
}