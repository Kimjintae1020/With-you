package With.you.example.With.you.Report.Controller;

import With.you.example.With.you.Report.Dto.DtoReport;
import With.you.example.With.you.Report.Dto.DtoReportRequest;
import With.you.example.With.you.Report.Entity.Report;
import With.you.example.With.you.Report.Service.ReportService;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class ReportController {

    private final ReportService reportService;


    @GetMapping("/admin_1_report")
    public String getReports(Model model) {
        List<DtoReport> reports = reportService.getAllReports();
        model.addAttribute("reports", reports);
        return "admin_1_report";
    }



    // 게시글 작성자 신고하기
    @PostMapping("/report/board/{boardId}")
    public ResponseEntity<?> showReportForm(@PathVariable Long boardId,
                                            Model model,
                                            HttpSession session,
                                            @ModelAttribute DtoReportRequest dtoReportRequest) {
        String accountName = (String) session.getAttribute("LoginAccountName");

        reportService.processReport(boardId, accountName, dtoReportRequest, model);

        return ResponseEntity.ok("신고가 접수되었습니다.");
    }
}

