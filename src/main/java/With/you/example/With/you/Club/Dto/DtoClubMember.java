package With.you.example.With.you.Club.Dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class DtoClubMember {

    private String nickname;        // 회원 이름
    private String role;            // 역할 (리더, 멤버 등)
    private String joinDate;        // 가입일 (문자열)
    private String status;
}
