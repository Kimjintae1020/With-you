package With.you.example.With.you.Account.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoBoardSummary {
    private String title;     // 게시글 제목
    private String content;   // 게시글 내용
    private String createdAt; // 작성일 (String 타입)
}
