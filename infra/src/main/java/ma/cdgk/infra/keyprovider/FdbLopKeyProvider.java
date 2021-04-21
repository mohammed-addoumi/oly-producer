package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBLOP;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbLopKeyProvider implements KeyProvider<FDBLOP> {

	@Override
	public String getKey(FDBLOP event) {
		return event.getNumeroCompteDebit();
	}
}
