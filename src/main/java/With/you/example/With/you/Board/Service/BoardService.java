package With.you.example.With.you.Board.Service;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Account.Repository.AccountRepository;
import With.you.example.With.you.Board.Entity.Board;
import With.you.example.With.you.Board.Repository.BoardRepository;
import With.you.example.With.you.Board.Dto.DtoCreateBoard;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {

    private final BoardRepository boardRepository;
    private final AccountRepository accountRepository;

    @Transactional
    public String createBoard(DtoCreateBoard dtoCreateBoard, String loginName) {

        Optional<Account> createName = accountRepository.findByName(loginName);

        Board board = new Board();
        board.setAccount(createName.get());
        board.setBoardtitle(dtoCreateBoard.getBoardtitle());
        board.setBoardcontent(dtoCreateBoard.getBoardcontent());
        board.setCreatedAt(LocalDate.now());
        board.setUpdatedAt(LocalDate.now());
        boardRepository.save(board);


        return "ok";
    }
}
