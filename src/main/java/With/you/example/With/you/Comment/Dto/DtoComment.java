package With.you.example.With.you.Comment.Dto;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Board.Entity.Board;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoComment {

    private Long commentId;
    private String content;
    private Board board;
    private Account account;
    private LocalDate createAt;
    private LocalDate updateAt;
}
