package With.you.example.With.you.Board.Controller;

import With.you.example.With.you.Board.Dto.BoardPageResponse;
import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Board.Service.BoardService;
import With.you.example.With.you.Board.Dto.DtoCreateBoard;
import With.you.example.With.you.Comment.Entity.Comment;
import With.you.example.With.you.Comment.Service.CommentService;
import With.you.example.With.you.Exception.NotLoginException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;

import java.time.format.DateTimeFormatter;
import java.util.List;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
public class BoardController {

    private final BoardService boardService;
    private final CommentService commentService;

    @GetMapping("/board")
    public String boardForm() {
        return "createboard";
    }

    // 게시글 생성
    @PostMapping("/create/board")
    public ResponseEntity<?> createBoard(@ModelAttribute DtoCreateBoard dtoCreateBoard, HttpSession session) {
        String Loginname = (String) session.getAttribute("LoginAccountName");
        boardService.createBoard(dtoCreateBoard,Loginname);
        return ResponseEntity.status(HttpStatus.OK).body("게시글이 작성되었습니다.");
    }

    //  게시글 목록 조회, 페이지당 10개
    @GetMapping("/boards")
    public String getPosts(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "10") int size,
                            Model model)   {


        Pageable pageable = PageRequest.of(page - 1, size);
        BoardPageResponse response = boardService.getBoardList(pageable);

        model.addAttribute("boards", response.getBoards());
        model.addAttribute("totalPages", response.getTotal_pages());
        model.addAttribute("currentPage", response.getPage());


        return "boardlist";
    }

    // 좋아요 수 증가
    @PostMapping("/board/like/{boardId}")
    public ResponseEntity<?> likeBoardCount(@PathVariable Long boardId,
                                            HttpSession session, Model model)  {
        String loginAccountName = (String) session.getAttribute("LoginAccountName");
        if (loginAccountName == null) {
            return ResponseEntity
                    .status(HttpStatus.FOUND) // 302 Found (리다이렉트용)
                    .header(HttpHeaders.LOCATION, "/login-required") // 이동할 URL
                    .build();

        }

        try {
            Board updatedBoard = boardService.likeBoardCount(boardId, loginAccountName);
            model.addAttribute("board", updatedBoard);
            return ResponseEntity.ok("게시글을 좋아요 눌렀습니다.");

        } catch (IllegalStateException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("이미 좋아요한 게시글입니다.");
        }
    }


    // 페이지 이동
    @GetMapping("/board/detail/{boardId}")
    public String boardDetail(@PathVariable Long boardId, Model model) {

        Board board = boardService.findByBoardId(boardId);
        List<Comment> comments = commentService.getCommentsByBoard(boardId);

        System.out.printf(board.toString());
        model.addAttribute("board", board);
        model.addAttribute("comments", comments);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String createdDate = board.getCreatedAt().format(formatter);
        model.addAttribute("createdDate", createdDate);

        return "boardDetail";
    }
}
