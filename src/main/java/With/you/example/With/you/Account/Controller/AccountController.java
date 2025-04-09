package With.you.example.With.you.Account.Controller;

import With.you.example.With.you.Account.Dto.DtoLogin;
import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Service.AccountService;
import With.you.example.With.you.Account.Dto.DtoRegister;
import With.you.example.With.you.Exception.AccounNametNotFoundException;
import With.you.example.With.you.Exception.NotEqualAccountIdAndPwException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.login.AccountNotFoundException;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
public class AccountController {

    private final AccountService accountService;

    // 페이지 이동
    @GetMapping("/")
    public String index() {
        return "index";  // /WEB-INF/views/index.jsp 로 연결
    }

    @GetMapping("/register")
    public String registerForm() {
        return "register";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    // 회원가입
    @PostMapping("/register")
    public String register(@ModelAttribute DtoRegister dtoRegister) {
        accountService.register(dtoRegister);
        return "index";
    }

    // 로그인
    @PostMapping("/login")
    public String login(@ModelAttribute DtoLogin dtoLogin, HttpSession session) throws NotEqualAccountIdAndPwException, AccountNotFoundException, AccounNametNotFoundException {
        Optional<Account> account = accountService.accountLogin(dtoLogin);

        session.setAttribute("LoginAccountName", account.get().getName());

        System.out.println("로그인 되었습니다.");
        return "redirect:/";
    }

    // 로그아웃
    @PostMapping("/logout")
    @ResponseBody
    public String logout(HttpSession session) {
        // 전체 세션 무효화
        session.invalidate();
        return "ok";
    }
}
