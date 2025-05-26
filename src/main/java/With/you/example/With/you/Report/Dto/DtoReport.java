package With.you.example.With.you.Report.Dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class DtoReport {
    private Long reportId;
    private String reportedAccountName;
    private String reporterName;
    private String reportType;
    private String reportReason;
    private String status;
    private String createdAt;
}
