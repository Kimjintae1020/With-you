package With.you.example.With.you.Club.Repository;

import With.you.example.With.you.Club.Entity.Club;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;


@Repository
public interface ClubRepository extends JpaRepository<Club,Long> {
    boolean existsByClubName(String clubName);



}
