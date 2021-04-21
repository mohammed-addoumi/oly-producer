package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBCPT;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbCptKeyProvider implements KeyProvider<FDBCPT> {

	@Override
	public String getKey(FDBCPT event) {
		return event.getNumeroCompte();
	}
}
