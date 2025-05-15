package With.you.example.With.you.Account.Service;

import With.you.example.With.you.Account.Dto.DtoLogin;
import With.you.example.With.you.Account.Dto.DtoMypage;
import With.you.example.With.you.Account.Dto.DtoRegister;
import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Enum.Grade;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Exception.AccounNametNotFoundException;
import With.you.example.With.you.Exception.NotEqualAccountIdAndPwException;
import With.you.example.With.you.Exception.NotLoginException;
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
                .accountname(dtoRegister.getAccountname())
                .password(encodedPassword)
                .nickname(dtoRegister.getNickname())
                .email(dtoRegister.getEmail())
                .birthYear(dtoRegister.getBirthYear())
                .grade(Grade.SEED)
                .region(dtoRegister.getRegion())
                .role(dtoRegister.getRole())
                .score(dtoRegister.getScore())
                .reviewCnt(dtoRegister.getReviewCnt())
                .build();

        accountRepository.save(account);

    }

    public Optional<Account> accountLogin(DtoLogin dtoLogin) throws NotEqualAccountIdAndPwException, AccountNotFoundException, AccounNametNotFoundException {

        String accountName = dtoLogin.getAccountname();
        String accountPw = dtoLogin.getPassword();

        log.info("accountName:{}, accountPw:{}", accountName, accountPw);

        Optional<Account> findAccount = accountRepository.findByAccountname(dtoLogin.getAccountname());


        if (dtoLogin.getAccountname() == "admin") {

            Optional<Account> adminAccount = accountRepository.findByAccountname(dtoLogin.getAccountname());

            if (!passwordEncoder.matches(dtoLogin.getPassword(), adminAccount.get().getPassword())) {
                throw new NotEqualAccountIdAndPwException("관리자 비밀번호가 일치하지 않습니다.");
            }

            return adminAccount;
        }

        if (accountName == null || accountPw == null) {
            throw new AccounNametNotFoundException("아이디 또는 비밀번호를 찾을 수 없습니다.");
        }
        if (findAccount.isEmpty()) {
            System.out.println("findAccount.get().getAccountname()" + findAccount.get().getAccountname());
            System.out.println("findAccount.get().getPassword()" + findAccount.get().getPassword());
            throw new AccountNotFoundException("회원 정보가 없습니다.");
        }

        if (!passwordEncoder.matches(dtoLogin.getPassword(), findAccount.get().getPassword())) {
            throw new NotEqualAccountIdAndPwException("비밀번호가 일치하지 않습니다.");
        }

        return findAccount;
    }

    // 마이페이지 로직
    public DtoMypage getMypage(String loginAccountName) throws NotLoginException {
        Optional<Account> optionalAccount = accountRepository.findByAccountname(loginAccountName);

        if (optionalAccount.isEmpty()) {
            throw new NotLoginException("로그인 되어 있지 않습니다.");
        }

        Account account = optionalAccount.get();

        return new DtoMypage(
                account.getAccountid(),
                account.getAccountname(),
                account.getPassword(),
                account.getNickname(),
                account.getEmail(),
                account.getBirthYear(),
                account.getGrade(),
                account.getRegion(),
                account.getRole(),
                account.getScore(),
                account.getReviewCnt(),
                account.getCreatedAt(),
                account.getUpdatedAt()
        );

    }
}
