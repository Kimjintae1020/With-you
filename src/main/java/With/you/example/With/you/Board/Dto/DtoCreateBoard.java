package With.you.example.With.you.Board.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoCreateBoard {

        private String title;
        private String content;
        private Long accountId;

}
