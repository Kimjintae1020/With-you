package With.you.example.With.you.Report.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.ReportType;
import With.you.example.With.you.Account.Service.AccountService;
import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Board.Service.BoardService;
import With.you.example.With.you.Report.Dto.DtoReport;
import With.you.example.With.you.Report.Dto.DtoReportRequest;
import With.you.example.With.you.Report.Entity.Report;
import With.you.example.With.you.Report.Repository.ReportRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReportService {

    private final ReportRepository reportRepository;
    private final BoardService boardService;
    private final AccountService accountService;

    @Transactional(rollbackFor = Exception.class)
    public void processReport(Long boardId, String accountName, DtoReportRequest dtoReportRequest, Model model) {

        Board board = boardService.getBoard(boardId);
        if (board == null) {
            throw new IllegalArgumentException("게시글을 찾을 수 없습니다.");
        }

        Account boardWriter = board.getAccount();
        if (boardWriter == null) {
            throw new IllegalArgumentException("게시글 작성자 정보를 찾을 수 없습니다.");
        }

        Account reporter = accountService.getAccountByName(accountName);
        if (reporter == null) {
            throw new IllegalArgumentException("신고자 정보를 찾을 수 없습니다.");
        }

        if (reporter.getAccountid().equals(boardWriter.getAccountid())) {
            throw new IllegalArgumentException("자기 자신을 신고할 수 없습니다.");
        }

        Report report = new Report();
        report.setBoard(board);
        report.setReporter(reporter);
        report.setReportedAccount(boardWriter);
        report.setReportType(ReportType.valueOf(String.valueOf(dtoReportRequest.getReportType())));
        report.setReportReason(dtoReportRequest.getReportReason());
        report.setEvidenceFiles(dtoReportRequest.getEvidenceText());
        report.setStatus("PENDING");

        reportRepository.save(report);

        model.addAttribute("reportStatus", "PENDING");


        model.addAttribute("boardId", boardId);
        model.addAttribute("boardTitle", board.getTitle());
        model.addAttribute("writerNickname", boardWriter.getNickname());
        model.addAttribute("writerId", boardWriter.getAccountid());
        model.addAttribute("reportType", dtoReportRequest.getReportType());
        model.addAttribute("reportReason", dtoReportRequest.getReportReason());
        model.addAttribute("evidenceText", dtoReportRequest.getEvidenceText());
        model.addAttribute("reporterNickname", reporter.getNickname());
        model.addAttribute("reportDate", LocalDateTime.now());

        model.addAttribute("reportStatus", "PENDING");
    }

    public List<DtoReport> getAllReports() {
        List<Report> reports = reportRepository.findAll();

        return reports.stream()
                .map(report -> DtoReport.builder()
                        .reportId(report.getReportId())
                        .reportedAccountName(report.getReportedAccount().getAccountname())
                        .reporterName(report.getReporter().getAccountname())
                        .reportType(report.getReportType().name())
                        .reportReason(report.getReportReason())
                        .status(report.getStatus())
                        .createdAt(report.getCreatedAt().toString()) // 날짜 형식은 필요에 따라 포맷
                        .build())
                .toList();
    }


}
