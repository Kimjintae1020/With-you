package With.you.example.With.you.Board.Entity;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Region;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "BOARD")
@Getter
@Setter
@NoArgsConstructor
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BOARD_ID")
    private Long boardId;

    @Column(name = "BOARD_TITLE")
    private String title;

    @Column(name = "BOARD_CONTENT", nullable = false)
    private String content;

    @Column(name = "BOARD_LIKE_COUNT", nullable = false)
    private int likecount;

    @Enumerated(EnumType.STRING)
    @Column(name = "REGION", nullable = false)
    private Region region;             // 활동 지역

    @Column(name = "BOARD_CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "BOARD_UPDATED_AT", nullable = false)
    private LocalDateTime updatedAt;

    @ElementCollection(fetch = FetchType.EAGER) // 항상 조회하기 위해 EAGER 전략 선택
    @CollectionTable(name = "BOARD_LIKED_ACCOUNTS", joinColumns = @JoinColumn(name = "BOARD_ID"))
    @Column(name = "ACCOUNT_NAME")
    private Set<String> likedAccountNames = new HashSet<>();


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ACCOUNT_ID", nullable = false) // FK 컬럼명 지정
    private Account account;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
        this.updatedAt = this.createdAt;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }
}
