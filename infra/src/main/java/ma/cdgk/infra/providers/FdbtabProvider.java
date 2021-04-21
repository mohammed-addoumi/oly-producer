package ma.cdgk.infra.providers;

import java.util.Optional;
import lombok.RequiredArgsConstructor;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.infra.eventrepositories.FdbtabRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class FdbtabProvider {

	private final FdbtabRepository fdbtabRepository;

	@Cacheable("fdtabCache")
	public Optional<Fdbtab> getFdbtabByTbidAndTbcode(String tbid, String tbcode) {
		return fdbtabRepository.findFirstByTbidAndTbcodeContaining(tbid, tbcode);
	}

	@Cacheable("fdtabCache")
	public Optional<Fdbtab> getFdbtabByTbidAndTbcodeAndTbetatIsBlank(String tbid, String tbcode) {
		return fdbtabRepository.findByTbidAndTbcodeContaining(tbid, tbcode).stream()
				.filter(fdbtab -> fdbtab.getTbetat().isBlank()).findFirst();
	}

}
