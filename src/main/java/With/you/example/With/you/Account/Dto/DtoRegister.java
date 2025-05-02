package With.you.example.With.you.Account.Dto;

import With.you.example.With.you.Account.Enum.Grade;
import With.you.example.With.you.Account.Enum.Region;
import With.you.example.With.you.Account.Role.Role;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DtoRegister {

    private String accountname;
    private String password;
    private String nickname;
    private String email;
    private int birthYear;
    private Region region;
    private Role role;
    private int score;
    private int reviewCnt;
}
