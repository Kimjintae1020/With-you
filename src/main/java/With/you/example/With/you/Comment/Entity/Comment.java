package With.you.example.With.you.Comment.Entity;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Board.Entity.Board;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "COMMENT")
@Getter
@Setter
@NoArgsConstructor
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COMMENT_ID")
    private Long commentid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ACCOUNT_ID", nullable = false)
    private Account account;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "BOARD_ID", nullable = false)
    private Board board;

    @Column(name = "COMMENT_CONTENT")
    private String content;

    @Column(name = "COMMENT_CREATED_AT")
    private LocalDate createAt;

    @Column(name = "BOARD_UPDATED_AT")
    private LocalDate updateAt;



}
