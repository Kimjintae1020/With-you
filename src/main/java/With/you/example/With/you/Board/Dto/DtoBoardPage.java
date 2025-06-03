package With.you.example.With.you.Board.Dto;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Grade;
import With.you.example.With.you.Board.Entity.Board;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DtoBoardPage {

    private String nickname;
    private Grade grade;

    private Long boardid;
    private String title;
    private String content;
    private int likecount;
    private int commentCount;
    private String createdAt;
    private String updatedAt;
    private String regionLabel;

    // 작성자 정보
    private String writerName;
    private String writerNickname;

    public DtoBoardPage(Board board) {
        this.nickname = board.getAccount().getNickname();
        this.grade = board.getAccount().getGrade();

        this.boardid = board.getBoardId();
        this.title = board.getTitle();
        this.content = board.getContent();
        this.likecount = board.getLikecount();
        this.commentCount = board.getComments().size();
        this.writerName = board.getAccount().getAccountname();
        this.writerNickname = board.getAccount().getNickname();
        this.regionLabel = board.getRegion().getLabel();
        this.createdAt = board.getCreatedAt().toLocalDate().toString();
        this.updatedAt = board.getUpdatedAt().toLocalDate().toString();

    }
}