package ma.cdgk.infra.keyprovider;

import ma.cdgk.domain.events.oly.FDBCPZ;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbCpzKeyProvider implements KeyProvider<FDBCPZ> {

	@Override
	public String getKey(FDBCPZ event) {
		return event.getNumeroCompte();
	}
}
