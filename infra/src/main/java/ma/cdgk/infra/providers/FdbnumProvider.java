package ma.cdgk.infra.providers;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.infra.eventrepositories.FdbnumRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class FdbnumProvider {
	private final FdbnumRepository fdbnumRepository;

	@Cacheable("fdbnum")
	public Optional<Fdbnum> getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(String nuraci, String nugre,
			String nurub, String numon, String nutype) {

		return fdbnumRepository.findByNuraciAndNugreAndNurubAndNumonAndNutype(nuraci, nugre, nurub, numon, nutype);
	}
}
