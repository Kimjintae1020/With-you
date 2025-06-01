package With.you.example.With.you.Account.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DtoClubSummary {
    private String clubName;   // 동호회 이름
    private String region;     // 지역명
    private String joinedAt;   // 가입일
    private String updatedAt;  // 수정일
}
