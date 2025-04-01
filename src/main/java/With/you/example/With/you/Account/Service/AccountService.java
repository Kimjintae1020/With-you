package With.you.example.With.you.Account.Service;

import With.you.example.With.you.Account.Dto.DtoRegister;
import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class AccountService {

    private final AccountRepository accountRepository;
    private final PasswordEncoder passwordEncoder;

    public void register(DtoRegister dtoRegister) {

        String encodedPassword = passwordEncoder.encode(dtoRegister.getPassword());

        Account account = Account.builder()
                .name(dtoRegister.getName())
                .password(encodedPassword)
                .role(dtoRegister.getRole())
                .build();

        accountRepository.save(account);

    }

}
