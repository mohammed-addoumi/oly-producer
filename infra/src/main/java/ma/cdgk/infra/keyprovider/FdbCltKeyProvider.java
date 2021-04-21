package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBCLT;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbCltKeyProvider implements KeyProvider<FDBCLT> {

	@Override
	public String getKey(FDBCLT event) {
		return event.getTiraci();
	}
}
