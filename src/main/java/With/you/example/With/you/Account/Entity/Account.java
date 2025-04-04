package With.you.example.With.you.Account.Entity;

import With.you.example.With.you.Account.Role.Role;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "ACCOUNT")
@Getter
@Setter
@NoArgsConstructor
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ACCOUNT_ID")
    private Long accountid;

    @Column(name = "ACCOUNT_NAME", nullable = false, length = 30)
    private String name;

    @Column(name = "ACCOUNT_PASSWORD", nullable = false, length = 200)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "ROLE", nullable = false)
    private Role role;


    @Builder
    public Account(String name, String password, Role role) {
        this.name = name;
        this.password = password;
        this.role = role;
    }

}
