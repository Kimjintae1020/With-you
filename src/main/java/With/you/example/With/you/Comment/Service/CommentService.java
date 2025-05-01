package With.you.example.With.you.Comment.Service;


import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Board.Repository.BoardRepository;
import With.you.example.With.you.Comment.Dto.DtoComment;
import With.you.example.With.you.Comment.Dto.DtoCommentUpdate;
import With.you.example.With.you.Comment.Entity.Comment;
import With.you.example.With.you.Comment.Repository.CommentRepository;
import With.you.example.With.you.Exception.CustomException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;

import static With.you.example.With.you.Exception.ErrorCode.*;

@Service
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class CommentService {

    private final CommentRepository commentRepository;
    private final BoardRepository boardRepository;
    private final AccountRepository accountRepository;

    // 댓글 작성
    @Transactional
    public List<Comment> createComment(DtoComment dtoComment, Long boardId, String loginAccountName) {

        Account createName = accountRepository.findByAccountname(loginAccountName)
                .orElseThrow(() -> new CustomException(ACCOUNT_NOT_FOUND));

        Board findBoard = boardRepository.findById(boardId)
                .orElseThrow(() -> new CustomException(BOARD_NOT_FOUND));

        Comment comment = new Comment();
        comment.setAccount(createName);
        comment.setContent(dtoComment.getContent());
        comment.setBoard(findBoard);
        comment.setCreateAt(LocalDate.now());
        comment.setUpdateAt(LocalDate.now());

        commentRepository.save(comment);
        return commentRepository.findByBoardBoardId(boardId);

    }

    public List<Comment> getCommentsByBoard(Long boardId) {
        return commentRepository.findByBoardBoardId(boardId);
    }

    @Transactional
    public void updateComment(DtoCommentUpdate dtoCommentUpdate, Long commentId, String loginAccountName) {

        Account account = accountRepository.findByAccountname(loginAccountName)
                .orElseThrow(() -> new CustomException(ACCOUNT_NOT_FOUND));

        Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new CustomException(COMMENT_NOT_FOUND));

        if (!comment.getAccount().getAccountname().equals(account.getAccountname())) {
            throw new CustomException(NO_EDIT_PERMISSION);
        }

        comment.setContent(dtoCommentUpdate.getContent());
        comment.setUpdateAt(LocalDate.now());

    }

}
