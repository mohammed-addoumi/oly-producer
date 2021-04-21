package ma.cdgk.infra.providers;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.infra.eventrepositories.FdbcliRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class FdbcliProvider {

	private final FdbcliRepository fdbcliRepository;

	@Cacheable("fdbcli")
	public Optional<Fdbcli> getClientByClraci(String cpraci) {
		return fdbcliRepository.findByClraci(cpraci);
	}

	@Cacheable("fdbcli_by_cltype")
	public Optional<Fdbcli> getClientByClraciAndCltype(String cpraci, String cltype) {
		return fdbcliRepository.findByClraciAndCltype(cpraci, cltype);
	}
}
