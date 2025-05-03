package With.you.example.With.you.Board.Repository;

import With.you.example.With.you.Board.Entity.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface BoardRepository extends JpaRepository<Board,Long> {

}
