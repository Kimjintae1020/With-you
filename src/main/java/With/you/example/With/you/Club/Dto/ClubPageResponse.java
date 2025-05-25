package With.you.example.With.you.Club.Dto;

import lombok.Getter;

import java.util.List;

@Getter
public class ClubPageResponse {

    private int page;         // 현재 페이지
    private int total_pages;  // 전체 페이지 수
    private int total_items;  // 전체 아이템 개수
    private List<DtoClubPage> clubs;

    public ClubPageResponse(int page, int totalPages, int totalItems, List<DtoClubPage> content) {
        this.page = page;
        this.total_pages = totalPages;
        this.total_items = totalItems;
        this.clubs = content;
    }
}
