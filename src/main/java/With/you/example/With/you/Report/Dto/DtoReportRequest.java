package With.you.example.With.you.Report.Dto;


import With.you.example.With.you.Account.Enum.ReportType;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DtoReportRequest {
    private ReportType reportType;         // 신고 유형
    private String reportReason;       // 신고 사유
    private String evidenceText;       // 증거 내용 (텍스트)
}
