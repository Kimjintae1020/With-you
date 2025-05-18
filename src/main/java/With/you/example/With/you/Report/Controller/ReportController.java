package With.you.example.With.you.Report.Controller;

import With.you.example.With.you.Account.Service.AccountService;
import With.you.example.With.you.Board.Service.BoardService;
import With.you.example.With.you.Report.Dto.DtoReportRequest;
import With.you.example.With.you.Report.Service.ReportService;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/report")
@Slf4j
public class ReportController {

    private final ReportService reportService;


    // 게시글 작성자 신고하기
    @PostMapping("/board/{boardId}")
    public ResponseEntity<?> showReportForm(@PathVariable Long boardId,
                                            Model model,
                                            HttpSession session,
                                            @ModelAttribute DtoReportRequest dtoReportRequest) {
        String accountName = (String) session.getAttribute("accountName");

        reportService.processReport(boardId, accountName, dtoReportRequest, model);

        return ResponseEntity.ok("신고가 접수되었습니다.");
    }
}

