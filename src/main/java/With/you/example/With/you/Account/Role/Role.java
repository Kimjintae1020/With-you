package With.you.example.With.you.Account.Role;

import lombok.Getter;

@Getter
public enum Role {
    ROLE_USER,
    ROLE_ADMIN;

    public String getAuthority() {
        return name();
    }
}
