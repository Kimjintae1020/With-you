package With.you.example.With.you.Account.Controller;

import With.you.example.With.you.Account.Service.AccountService;
import With.you.example.With.you.Account.Dto.DtoRegister;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
public class AccountController {

    private final AccountService accountService;

    @GetMapping("/")
    public String index() {
        return "index";  // /WEB-INF/views/index.jsp 로 연결
    }

    // 회원가입
    @PostMapping("/register")
    public String register(@ModelAttribute DtoRegister dtoRegister) {
        accountService.register(dtoRegister);
        return "index";
    }
    @GetMapping("/register")
    public String registerForm() {
        return "register";
    }


}
