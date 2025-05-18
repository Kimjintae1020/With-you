package With.you.example.With.you.Club.Controller;

import With.you.example.With.you.Club.Service.ClubService;
import With.you.example.With.you.Club.Dto.DtoCreateClub;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class ClubController {

    private final ClubService clubService;

    // 동호회 생성하기
    @PostMapping("/create/club")
    public ResponseEntity<?> createClub(Model model,
                                        HttpSession session,
                                        @ModelAttribute DtoCreateClub dtoCreateClub) {
        String accountName = (String) session.getAttribute("accountName");

        clubService.createClub(accountName, dtoCreateClub);

        return ResponseEntity.ok("동호회 생성되었습니다.");
    }

}
