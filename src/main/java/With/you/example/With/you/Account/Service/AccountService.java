package With.you.example.With.you.Account.Service;

import With.you.example.With.you.Account.Dto.DtoLogin;
import With.you.example.With.you.Account.Dto.DtoRegister;
import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Exception.AccounNametNotFoundException;
import With.you.example.With.you.Exception.NotEqualAccountIdAndPwException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.security.auth.login.AccountNotFoundException;
import java.util.Optional;

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

    public Optional<Account> accountLogin(DtoLogin dtoLogin) throws NotEqualAccountIdAndPwException, AccountNotFoundException, AccounNametNotFoundException {

        String accountName = dtoLogin.getName();
        String accountPw = dtoLogin.getPassword();

        log.info("accountName:{}, accountPw:{}", accountName, accountPw);

        Optional<Account> findaccount = accountRepository.findByName(dtoLogin.getName());
        log.info("findaccountName:{}", findaccount.get().getName());
        if (accountName == null || accountPw == null) {
            throw new AccounNametNotFoundException("아이디 또는 비밀번호를 찾을 수 없습니다.");
        }
        if (findaccount.isEmpty()) {
            throw new AccountNotFoundException("회원 정보가 없습니다.");
        }

        // 2. 비밀번호 매칭 확인
        if (!passwordEncoder.matches(dtoLogin.getPassword(), findaccount.get().getPassword())) {
            throw new NotEqualAccountIdAndPwException("비밀번호가 일치하지 않습니다.");
        }

        return findaccount;
    }
}
