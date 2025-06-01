package With.you.example.With.you.Account.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoMypage {
    private Long accountid;
    private String accountname; // 아이디
    private String nickname;
    private String email;
    private int birthYear;
    private String grade; // 필요에 따라 String으로
    private String region; // 필요에 따라 String으로
    private String role;
    private int score; // 사용자 평점
    private int reviewCnt; // 받은 평가 수
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // ✨ 새롭게 추가 (Board, Comment, Club)
    private List<DtoBoardSummary> boardSummaries;
    private List<DtoCommentSummary> commentSummaries;
    private List<DtoClubSummary> clubSummaries;
}
