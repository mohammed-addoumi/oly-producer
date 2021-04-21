package ma.cdgk.infra.eventenricher;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import ma.cdgk.domain.events.oly.FDBCPZ;
import ma.cdgk.infra.TestBaseConfig;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.utils.UtilServiceImpl;
import ma.cdgk.producer.starter.domain.eventType.EventTypeProvider;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {TestBaseConfig.class, FdbCpzEventEnricher.class, FDBCpzEventEnricherTest.Config.class,
		UtilServiceImpl.class})
class FDBCpzEventEnricherTest {

	@Autowired
	FdbCpzEventEnricher fdbCpzEventEnricher;

	FDBCPZ fdbcpz;

	@BeforeEach
	void init() throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
		this.fdbcpz = new FDBCPZ();
		this.fdbcpz.setCpzrac("5003534");
		this.fdbcpz.setCpzgre("002");
		this.fdbcpz.setCpzmon("002");
		this.fdbcpz.setCpzrub("001");
	}

	@Test
	void enrich_Should_Add_EventType_To_FDBCPZ() {
		Assertions.assertNull(fdbcpz.getEventType());
		fdbCpzEventEnricher.enrich(fdbcpz);
		Assertions.assertEquals("OLY.FDBCPZ", fdbcpz.getEventType());
	}

	@Test
	void enrich_Should_Add_NumeroCompte_To_FDBCPZ() {
		Assertions.assertNull(fdbcpz.getNumeroCompte());
		fdbCpzEventEnricher.enrich(fdbcpz);
		Assertions.assertEquals("5003534002001002", fdbcpz.getNumeroCompte());
	}

	public static class Config {

		@Bean
		EventTypeProvider eventTypeObjectProvider() {
			return new EventTypeProviderImpl();
		}
	}
}
