package With.you.example.With.you.Account.Dto;

import With.you.example.With.you.Account.Enum.Grade;
import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Account.Role.Role;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoMypage {

    private Long accountid;
    private String accountname; // 아이디
    private String password; // 비밀번호
    private String nickname;
    private String email;
    private int birthYear;
    private Grade grade; // 등급 (ENUM)
    private Region region; // 거주지 (ENUM)
    private Role role; // 사용자 권한 (ENUM)
    private int score; // 사용자 평점
    private int reviewCnt; // 받은 평가 수
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
