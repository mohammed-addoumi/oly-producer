package ma.cdgk.infra.eventrepositories;

import java.util.List;
import java.util.Optional;
import ma.cdgk.domain.entities.Fdbtab;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FdbtabRepository extends JpaRepository<Fdbtab, String> {

	Optional<Fdbtab> findFirstByTbidAndTbcodeContaining(String tbid, String tbcode);

	List<Fdbtab> findByTbidAndTbcodeContaining(String tbid, String tbcode);
}
