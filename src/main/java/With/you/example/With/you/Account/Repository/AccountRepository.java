package With.you.example.With.you.Account.Repository;

import With.you.example.With.you.Account.Entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Account,Long> {

}
