package ma.cdgk.infra.keyprovider;

import ma.cdgcapital.avro.oly.FDBCJC;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.springframework.stereotype.Component;

@Component
public class FdbcjcKeyProvider implements KeyProvider<FDBCJC> {

	@Override
	public String getKey(FDBCJC event) {
		return event.getCjccope() + "-" + event.getCjcnope();
	}
}
