package With.you.example.With.you.Account.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoCommentSummary {
    private String content;     // 댓글 내용
    private String boardTitle;  // 댓글이 달린 게시글 제목
    private String createdAt;   // 생성일
    private String updatedAt;   // 수정일
}
