package With.you.example.With.you.Club.Controller;

import With.you.example.With.you.Club.Dto.ClubPageResponse;
import With.you.example.With.you.Club.Dto.DtoClubDetail;
import With.you.example.With.you.Club.Dto.DtoClubMember;
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

import java.util.List;


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

    //  동호회 목록 조회, 페이지당 9개
    @GetMapping("/club/list/account")
    public String clubList(@RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "9") int size,
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

    // 동호회 상세조회 및 회원 목록 조회
    @GetMapping("/club/detail/{clubId}")
    public String getClubDetail(Model model,
                                @PathVariable Long clubId,
                                HttpSession session) {
        String accountName = (String) session.getAttribute("LoginAccountName");

        DtoClubDetail response = clubService.getClubDetail(accountName, clubId);
        List<DtoClubMember> members = clubService.getClubMembers(clubId);

        model.addAttribute("club", response);
        model.addAttribute("members", members);

        return "clubdetail";
    }

    // 동호회 가입신청
    @PostMapping("/club/join/{clubId}")
    public String joinClub(@PathVariable Long clubId, HttpSession session) {
        String accountName = (String) session.getAttribute("LoginAccountName");
        clubService.joinClub(accountName, clubId);

        return "redirect:/api/club/detail/" + clubId;
    }


    // 관리자 동호회 목록 조회
    @GetMapping("/admin/club/list")
    public String getAdminClubList(Model model, HttpSession session) {
        String accountName = (String) session.getAttribute("LoginAccountName");

        List<DtoClubDetail> clubs = clubService.getAllClubsForAdmin();

        model.addAttribute("clubs", clubs);

        return "admin_3_club";
    }

    // 관리자 - 동호회 상태 변경
    @PostMapping("/admin/club/status/{clubId}")
    public String updateClubStatus(@PathVariable Long clubId, @RequestParam("status") String status) {
        clubService.updateClubStatus(clubId, status);
        return "redirect:/api/admin/club/list";
    }




}
