package With.you.example.With.you.Report.Dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DtoReportRequest {
    private String reportType;         // 신고 유형
    private String reportReason;       // 신고 사유
    private String evidenceText;       // 증거 내용 (텍스트)
}
