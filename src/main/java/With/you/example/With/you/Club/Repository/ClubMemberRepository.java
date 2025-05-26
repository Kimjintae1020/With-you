package With.you.example.With.you.Club.Repository;

import With.you.example.With.you.Account.Entity.Account;
import With.you.example.With.you.Club.Entity.Club;
import With.you.example.With.you.Club.Entity.ClubMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClubMemberRepository extends JpaRepository<ClubMember, Long> {


    boolean existsByClubAndAccount(Club club, Account account);

    List<ClubMember> findByClub(Club club);

}
