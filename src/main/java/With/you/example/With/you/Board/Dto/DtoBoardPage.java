package With.you.example.With.you.Board.Dto;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Board.Entity.Board;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class DtoBoardPage {

    private Long boardid;
    private String title;
    private String content;
    private int likecount;
    private String createdAt;
    private String updatedAt;
    private String regionLabel;

    // 작성자 정보
    private String writerName;
    private String writerNickname;

    public DtoBoardPage(Board board ) {
        this.boardid = board.getBoardId();
        this.title = board.getTitle();
        this.content = board.getContent();
        this.likecount = board.getLikecount();
        this.writerName = board.getAccount().getAccountname();
        this.writerNickname = board.getAccount().getNickname();
        this.regionLabel = board.getAccount().getRegion().getLabel();
        this.createdAt = board.getCreatedAt().toLocalDate().toString();
        this.updatedAt = board.getUpdatedAt().toLocalDate().toString();

    }
}