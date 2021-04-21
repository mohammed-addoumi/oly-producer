package ma.cdgk.infra.eventrepositories;

import java.util.Optional;
import ma.cdgk.domain.entities.Fdblop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FdblopRepository extends JpaRepository<Fdblop, String> {

	Optional<Fdblop> findByOpidAndOpnope(String opid, String opnope);

	Optional<Fdblop> findByOpidAndLplref(String opid, Long lplref);
}
