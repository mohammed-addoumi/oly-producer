package ma.cdgk.infra.eventrepositories;

import java.util.Optional;
import ma.cdgk.domain.entities.Fdbcli;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FdbcliRepository extends JpaRepository<Fdbcli, String> {

	Optional<Fdbcli> findByClraci(String clraci);

	Optional<Fdbcli> findByClraciAndCltype(String clraci, String cltype);
}
