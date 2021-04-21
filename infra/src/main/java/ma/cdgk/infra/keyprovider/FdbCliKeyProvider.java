package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBCLI;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbCliKeyProvider implements KeyProvider<FDBCLI> {
	@Override
	public String getKey(FDBCLI event) {
		return event.getClraci();
	}
}
