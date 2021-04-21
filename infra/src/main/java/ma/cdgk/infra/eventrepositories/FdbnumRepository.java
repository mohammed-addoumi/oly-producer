package ma.cdgk.infra.eventrepositories;

import java.util.Optional;
import ma.cdgk.domain.entities.Fdbnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FdbnumRepository extends JpaRepository<Fdbnum, String> {

	Optional<Fdbnum> findByNuraciAndNugreAndNurubAndNumonAndNutype(String nuraci, String nugre, String nurub,
			String numon, String nutype);
}
