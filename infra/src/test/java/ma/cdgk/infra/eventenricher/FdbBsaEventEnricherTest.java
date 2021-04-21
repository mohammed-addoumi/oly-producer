package ma.cdgk.infra.eventenricher;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import ma.cdgk.domain.events.oly.FDBBSA;
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
@ContextConfiguration(classes = {TestBaseConfig.class, FdbBsaEventEnricher.class, FdbBsaEventEnricherTest.Config.class,
		UtilServiceImpl.class})
class FdbBsaEventEnricherTest {

	@Autowired
	FdbBsaEventEnricher fdbBsaEventEnricher;

	FDBBSA fdbbsa;

	@BeforeEach
	void init() throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
		this.fdbbsa = new FDBBSA();
	}

	@Test
	void enrich_Should_Add_EventType_To_FDBBSA() {
		Assertions.assertNull(fdbbsa.getEventType());
		fdbBsaEventEnricher.enrich(fdbbsa);
		Assertions.assertEquals("OLY.FDBBSA", fdbbsa.getEventType());
	}

	public static class Config {

		@Bean
		EventTypeProvider eventTypeObjectProvider() {
			return new EventTypeProviderImpl();
		}
	}
}
