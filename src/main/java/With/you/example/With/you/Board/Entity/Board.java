package With.you.example.With.you.Board.Entity;

import With.you.example.With.you.Account.Entity.Account;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "BOARD")
@Getter
@Setter
@NoArgsConstructor
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BOARD_ID")
    private Long boardid;

    @Column(name = "BOARD_TITLE")
    private String boardtitle;

    @Column(name = "BOARD_CONTENT", nullable = false)
    private String boardcontent;

    @Column(name = "BOARD_CREATED_AT", nullable = false)
    private LocalDate createdAt;

    @Column(name = "BOARD_UPDATED_AT", nullable = false)
    private LocalDate updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ACCOUNT_ID", nullable = false) // FK 컬럼명 지정
    private Account account;

}
