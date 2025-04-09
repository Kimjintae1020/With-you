package With.you.example.With.you.Board.Controller;

import With.you.example.With.you.Board.Service.BoardService;
import With.you.example.With.you.Board.Dto.DtoCreateBoard;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/board")
    public String boardForm() {
        return "createboard";
    }

    // 게시글 생성
    @PostMapping("/create/board")
    public String createBoard(@ModelAttribute DtoCreateBoard dtoCreateBoard, HttpSession session) {
        String Loginname = (String) session.getAttribute("LoginAccountName");
        boardService.createBoard(dtoCreateBoard,Loginname);
        return "redirect:/";
    }

}
