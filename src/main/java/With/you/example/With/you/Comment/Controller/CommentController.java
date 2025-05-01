package With.you.example.With.you.Comment.Controller;

import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Board.Service.BoardService;
import With.you.example.With.you.Comment.Service.CommentService;
import With.you.example.With.you.Comment.Dto.DtoComment;
import With.you.example.With.you.Comment.Entity.Comment;
import With.you.example.With.you.Exception.NotLoginException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
public class CommentController {

    private final CommentService commentService;
    private final BoardService boardService;

    // 페이지 이동
    @GetMapping("/board/detail/{boardId}")
    public String boardDetail(@PathVariable Long boardId, Model model) {

        Board board = boardService.findByBoardId(boardId);
        List<Comment> comments = commentService.getCommentsByBoard(boardId);

        model.addAttribute("board", board);
        model.addAttribute("comments", comments);

        return "boardDetail";
    }



    // 댓글작성
    @PostMapping("/comment/{boardId}")
    public ResponseEntity<?> createComment(@PathVariable Long boardId,
                                           @ModelAttribute DtoComment dtoComment,
                                           HttpSession session, Model model) throws NotLoginException {

        String loginAccountName = (String) session.getAttribute("LoginAccountName");
        if (loginAccountName == null) {
            throw new NotLoginException("로그인되어 있지 않습니다.");
        }

        commentService.createComment(dtoComment, boardId, loginAccountName);

        List<Comment> reviews = commentService.getCommentsByBoard(boardId);
        Board board = boardService.findByBoardId(boardId);

        model.addAttribute("board", board);
        model.addAttribute("reviews", reviews);

        return ResponseEntity.ok("댓글 작성이 완료되었습니다.");
    }

}
