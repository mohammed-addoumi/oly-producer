package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBMVT;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbMvtKeyProvider implements KeyProvider<FDBMVT> {

	@Override
	public String getKey(FDBMVT event) {
		return event.getNumeroCompte();
	}
}
