package With.you.example.With.you.Club.Controller;

import With.you.example.With.you.Club.Dto.ClubPageResponse;
import With.you.example.With.you.Club.Service.ClubService;
import With.you.example.With.you.Club.Dto.DtoCreateClub;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class ClubController {

    private final ClubService clubService;

    @GetMapping("/clubcreate")
    public String clubCreatePage() {
        return "clubcreate"; // JSP 파일명
    }

    //  동호회 목록 조회, 페이지당 3개
    @GetMapping("/clublist")
    public String clubList(@RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "3") int size,
                           Model model)   {


        Pageable pageable = PageRequest.of(page - 1, size);
        ClubPageResponse response = clubService.getClubList(pageable);


        model.addAttribute("clubs", response.getClubs());
        model.addAttribute("currentPage", response.getPage());
        model.addAttribute("totalPages", response.getTotal_pages());

        return "clublist";
    }

    // 동호회 생성하기
    @PostMapping("/create/club")
    public ResponseEntity<?> createClub(Model model,
                                        HttpSession session,
                                        @RequestBody DtoCreateClub dtoCreateClub) {
        String accountName = (String) session.getAttribute("LoginAccountName");

        log.info(dtoCreateClub.getCategory());
        clubService.createClub(accountName, dtoCreateClub);

        return ResponseEntity.ok("동호회 생성되었습니다.");
    }

}
