package With.you.example.With.you.Board.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Board.Dto.BoardPageResponse;
import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Board.Repository.BoardRepository;
import With.you.example.With.you.Board.Dto.DtoCreateBoard;
import With.you.example.With.you.Exception.CustomException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

import static With.you.example.With.you.Exception.ErrorCode.BOARD_NOT_FOUND;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {

    private final BoardRepository boardRepository;
    private final AccountRepository accountRepository;

    // 게시글 생성
    @Transactional
    public String createBoard(DtoCreateBoard dtoCreateBoard, String loginName) {

        Optional<Account> createName = accountRepository.findByAccountname(loginName);

        if (createName.isEmpty()) {
            throw new RuntimeException("해당 유저를 찾을 수 없습니다: " + loginName);
        }

        Account account = createName.get();

        Board board = new Board();
        board.setAccount(account);
        board.setTitle(dtoCreateBoard.getTitle());
        board.setContent(dtoCreateBoard.getContent());
        board.setLikecount(0);

        boardRepository.save(board);

        return "ok";
    }

    // 게시글 목록 조회
    public BoardPageResponse getBoardList(Pageable pageable) {
        Page<Board> boards = boardRepository.findAll(pageable);

        return new BoardPageResponse(
                pageable.getPageNumber() + 1,
                boards.getTotalPages(),
                (int) boards.getTotalElements(),
                boards.getContent()
        );
    }

    public Board findByBoardId(Long boardId) {
        return boardRepository.findById(boardId)
                .orElseThrow(() -> new CustomException(BOARD_NOT_FOUND));

    }

    public Board likeBoardCount(Long boardId) {

        Optional<Board> optionalBoard = boardRepository.findById(boardId);

        if (optionalBoard.isPresent()) {
            Board board = optionalBoard.get();
            board.setLikecount(board.getLikecount() + 1);
            boardRepository.save(board); // 👍 변경사항 반영
            return board;
        } else {
            throw new IllegalArgumentException("게시글이 존재하지 않습니다.");
        }
    }

    public Board getBoardDetail(Long boardId) {
        Optional<Board> board = boardRepository.findById(boardId);
        return board.orElseThrow(() -> new CustomException(BOARD_NOT_FOUND));
    }
}
