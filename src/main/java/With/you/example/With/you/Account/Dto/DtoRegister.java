package With.you.example.With.you.Account.Dto;

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

    private String name;
    private String password;
    private Role role;
}
