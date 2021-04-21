package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBAFL;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbAflKeyProvider implements KeyProvider<FDBAFL> {

	@Override
	public String getKey(FDBAFL event) {
		return event.getNumeroCompte();
	}
}
