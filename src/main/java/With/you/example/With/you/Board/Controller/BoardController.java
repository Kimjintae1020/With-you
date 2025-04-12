package With.you.example.With.you.Board.Controller;

import With.you.example.With.you.Board.Dto.BoardPageResponse;
import With.you.example.With.you.Board.Service.BoardService;
import With.you.example.With.you.Board.Dto.DtoCreateBoard;
import With.you.example.With.you.Exception.NotLoginException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;


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

        //  게시글 목록 조회, 페이지당 10개
        @GetMapping("/boards")
        public ResponseEntity<BoardPageResponse> getPosts(@RequestParam(defaultValue = "1") int page,
                                                          @RequestParam(defaultValue = "10") int size,
                                                          HttpSession session) throws NotLoginException {

            if (session.getAttribute("LoginAccountName") == null) {
                throw new NotLoginException("로그인 되어있지 않습니다.");
            }

            Pageable pageable = PageRequest.of(page - 1, size);
            BoardPageResponse response = boardService.getBoardList(pageable);
            return ResponseEntity.ok(response);

}
}
