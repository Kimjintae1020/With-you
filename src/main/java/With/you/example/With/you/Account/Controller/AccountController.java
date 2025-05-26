package With.you.example.With.you.Account.Controller;

import With.you.example.With.you.Account.Dto.DtoLogin;
import With.you.example.With.you.Account.Dto.DtoMypage;
import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Account.Role.Role;
import With.you.example.With.you.Account.Service.AccountService;
import With.you.example.With.you.Account.Dto.DtoRegister;
import With.you.example.With.you.Exception.AccounNametNotFoundException;
import With.you.example.With.you.Exception.NotEqualAccountIdAndPwException;
import With.you.example.With.you.Exception.NotLoginException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.login.AccountNotFoundException;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class AccountController {

    private final AccountService accountService;
    private final AccountRepository accountRepository;

    // 페이지 이동
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/register")
    public String registerForm() {
        return "register";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @GetMapping("/main")
    public String mainFrom() {
        return "main";
    }

    @GetMapping("/rank")
    public String rankForm() { return "rank"; }

    @GetMapping("/map")
    public String mapForm() { return "map"; }

    @GetMapping("/admin_1_main")
    public String admin_1_mainFrom(Model model) {
        List<Account> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);
        return "admin_1_main";
    }

    @GetMapping("/admin_2_approve")
    public String admin_2_approveForm(Model model) {
        List<Account> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);
        return "admin_2_approve";
    }

    // 회원가입
    @PostMapping("/register")
    public String register(@ModelAttribute DtoRegister dtoRegister) {
        accountService.register(dtoRegister);
        return "registerCompleted";
    }

    // 로그인
    @PostMapping("/login")
    public String login(@ModelAttribute DtoLogin dtoLogin, HttpSession session) throws NotEqualAccountIdAndPwException, AccountNotFoundException, AccounNametNotFoundException {
        Optional<Account> account = accountService.accountLogin(dtoLogin);

        System.out.println(account.get().getAccountname());
        session.setAttribute("LoginAccountName", dtoLogin.getAccountname());

        // 관리자 일시 Role 값 추가
        if ("admin".equals(account.get().getAccountname())) {
            session.setAttribute("Role", Role.ROLE_ADMIN);
            log.info("관리자 로그인");
            return "admin_1_main";
        }


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

    // 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) throws NotLoginException {
        String loginAccountName = (String) session.getAttribute("LoginAccountName");

        DtoMypage response =  accountService.getMypage(loginAccountName);

        model.addAttribute("mypage", response);

        return "mypage";
    }

}
