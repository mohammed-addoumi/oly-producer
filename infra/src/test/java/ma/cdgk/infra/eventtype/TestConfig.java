package ma.cdgk.infra.eventtype;

import ma.cdgk.infra.eventenricher.*;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;

@TestConfiguration
public class TestConfig {
	@Bean(name = "fdbCptEventEnricher")
	FdbCptEventEnricher fdbCptEventEnricher() {
		return new FdbCptEventEnricher(null, null, null, null);
	}

	@Bean(name = "fdbLopEventEnricher")
	FdbLopEventEnricher fdbLopEventEnricher() {
		return new FdbLopEventEnricher(null, null, null, null);
	}

	@Bean(name = "fdbMvteventTypeObject")
	FdbMvtEventEnricher fdbMvtEventEnricher() {
		return new FdbMvtEventEnricher(null, null, null, null, null);
	}

	@Bean(name = "fdbCtrEventEnricher")
	FdbCtrEventEnricher fdbCtrEventEnricher() {
		return new FdbCtrEventEnricher(null, null);
	}

	@Bean(name = "creComptableEventEnricher")
	FdbcjcEventEnricher creComptableEventEnricher() {
		return new FdbcjcEventEnricher(null, null, null, null, null);
	}
}
