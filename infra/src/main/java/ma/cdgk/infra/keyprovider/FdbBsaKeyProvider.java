package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBBSA;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbBsaKeyProvider implements KeyProvider<FDBBSA> {

	@Override
	public String getKey(FDBBSA event) {
		return event.getBsfill();
	}
}
