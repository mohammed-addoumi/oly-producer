package ma.cdgk.infra.providers;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import ma.cdgk.domain.entities.Fdblop;
import ma.cdgk.infra.eventrepositories.FdblopRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class FdblopProvider {

	private final FdblopRepository fdblopRepository;

	@Cacheable("Fdblop")
	public Optional<Fdblop> getOperationByByOpidAndOpnope(String opid, String opnope) {
		return fdblopRepository.findByOpidAndOpnope(opid, opnope);
	}

	@Cacheable("Fdblop")
	public Optional<Fdblop> getOperationByOpidAndLplref(String opid, Long lplref) {
		return fdblopRepository.findByOpidAndLplref(opid, lplref);
	}

}
