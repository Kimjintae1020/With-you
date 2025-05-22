    package With.you.example.With.you.Report.Entity;

    import With.you.example.With.you.Account.Entity.Account;
    import With.you.example.With.you.Account.Enum.ReportType;
    import With.you.example.With.you.Board.Entity.Board;
    import jakarta.persistence.*;
    import lombok.Getter;
    import lombok.NoArgsConstructor;
    import lombok.Setter;

    import java.time.LocalDateTime;

    @Entity
    @Table(name = "REPORTS")
    @Getter
    @Setter
    @NoArgsConstructor
    public class Report {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "REPORT_ID")
        private Long reportId;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "BOARD_ID", nullable = true) // NULL 허용
        private Board board;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "REPORTER_ID", nullable = false)
        private Account reporter;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "REPORTED_ACCOUNT_ID", nullable = false)
        private Account reportedAccount;

        @Enumerated(EnumType.STRING) // ← 이게 핵심입니다!
        @Column(name = "REPORT_TYPE", nullable = false)
        private ReportType reportType;
    
        @Column(name = "REPORT_REASON")
        private String reportReason;

        @Column(name = "EVIDENCE_FILES")
        private String evidenceFiles;

        @Column(name = "STATUS")
        private String status = "PENDING";

        @Column(name = "CREATED_AT", updatable = false)
        private LocalDateTime createdAt;

        @Column(name = "UPDATED_AT")
        private LocalDateTime updatedAt;

        @PrePersist
        protected void onCreate() {
            this.createdAt = LocalDateTime.now();
            this.updatedAt = this.createdAt;
        }

        @PreUpdate
        protected void onUpdate() {
            this.updatedAt = LocalDateTime.now();
        }
    }
