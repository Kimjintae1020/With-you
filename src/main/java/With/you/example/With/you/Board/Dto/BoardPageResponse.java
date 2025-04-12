package With.you.example.With.you.Board.Dto;

import With.you.example.With.you.Board.Entity.Board;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class BoardPageResponse {

    private int page;         // 현재 페이지
    private int total_pages;  // 전체 페이지 수
    private int total_items;  // 전체 아이템 개수
    private List<DtoBoardPage> boards; // 응답용 DTO

    public BoardPageResponse(int page, int totalPages, int totalItems, List<Board> content) {
        this.page = page;
        this.total_pages = totalPages;
        this.total_items = totalItems;
        this.boards = content.stream()
                .map(DtoBoardPage::new)
                .collect(Collectors.toList());
    }
}
