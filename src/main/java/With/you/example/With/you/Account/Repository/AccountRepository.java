package With.you.example.With.you.Account.Repository;

import With.you.example.With.you.Account.Entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account,Long> {

    Optional<Account> findByAccountname(String accountname);

    @Query("SELECT a FROM Account a WHERE LOWER(a.accountname) = LOWER(:accountname)")
    Optional<Account> findByAccountnameIgnoreCase(@Param("accountname") String accountname);


}
