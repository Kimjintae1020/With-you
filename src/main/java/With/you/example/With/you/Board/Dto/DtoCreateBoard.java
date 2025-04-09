package With.you.example.With.you.Board.Dto;

import With.you.example.With.you.Account.Entity.Account;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoCreateBoard {

        private Long boardid;
        private String boardtitle;
        private String boardcontent;
        private LocalDate createdAt;
        private LocalDate updatedAt;
        private Account accountName;        // 작성자

}
