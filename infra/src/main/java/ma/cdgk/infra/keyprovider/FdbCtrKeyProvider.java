package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBCTR;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbCtrKeyProvider implements KeyProvider<FDBCTR> {

	@Override
	public String getKey(FDBCTR event) {
		return event.getIdContrat();
	}
}
