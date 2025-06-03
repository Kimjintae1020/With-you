package With.you.example.With.you.Account.Entity;

import With.you.example.With.you.Account.Enum.Grade;
import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Account.Role.Role;
import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Club.Entity.ClubMember;
import With.you.example.With.you.Comment.Entity.Comment;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ACCOUNT")
@Getter
@Setter
@NoArgsConstructor
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ACCOUNT_ID")
    private Long accountid;

    @Column(name = "ACCOUNTNAME", nullable = false, length = 30, unique = true)
    private String accountname; // 아이디

    @Column(name = "PASSWORD", nullable = false, length = 200)
    private String password; // 비밀번호

    @Column(name = "NICKNAME", nullable = false, length = 30)
    private String nickname;

    @Column(name = "EMAIL", nullable = false, length = 100)
    private String email;

    @Column(name = "BIRTH_YEAR", nullable = false)
    private int birthYear;

    @Enumerated(EnumType.STRING)
    @Column(name = "GRADE", nullable = false)
    private Grade grade; // 등급 (ENUM)

    @Enumerated(EnumType.STRING)
    @Column(name = "REGION", nullable = false)
    private Region region; // 거주지 (ENUM)

    @Enumerated(EnumType.STRING)
    @Column(name = "ROLE", nullable = false)
    private Role role; // 사용자 권한 (ENUM)

    @Column(name = "SCORE", nullable = false)
    private int score; // 사용자 평점

    @Column(name = "REVIEW_CNT", nullable = false)
    private int reviewCnt; // 받은 평가 수

    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Board> boards = new ArrayList<>();

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ClubMember> clubMembers = new ArrayList<>();



    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
        this.updatedAt = this.createdAt;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    @Builder
    public Account(String accountname, String password, String nickname, String email,
                   int birthYear, Grade grade, Region region, Role role,
                   int score, int reviewCnt) {
        this.accountname = accountname;
        this.password = password;
        this.nickname = nickname;
        this.email = email;
        this.birthYear = birthYear;
        this.grade = grade;
        this.region = region;
        this.role = role;
        this.score = score;
        this.reviewCnt = reviewCnt;
    }

    public void updateGrade() {
        if (this.score <= 10) {
            this.grade = Grade.SEED;
        } else if (this.score <= 30) {
            this.grade = Grade.SPROUT;
        } else if (this.score <= 50) {
            this.grade = Grade.TREE;
        } else if (this.score <= 80) {
            this.grade = Grade.BLOOM;
        } else {
            this.grade = Grade.SUN;
        }
    }

}