package ma.cdgk.infra.eventenricher;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.IOException;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBCTR;
import ma.cdgk.infra.EventTestUtils;
import ma.cdgk.infra.TestBaseConfig;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.infra.utils.UtilServiceImpl;
import ma.cdgk.producer.starter.domain.eventType.EventTypeProvider;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {TestBaseConfig.class, FdbCtrEventEnricher.class, UtilServiceImpl.class,
		EventTestUtils.class, FdbCtrEventEnricherTest.Config.class})
class FdbCtrEventEnricherTest {

	@Autowired
	FdbCtrEventEnricher fdbCtrEventEnricher;
	@Autowired
	private EventTestUtils<FDBCTR> fdbctrEventTestUtils;
	private FDBCTR fdbctr;
	private FDBCTR fdbctrEnriched;

	@BeforeEach
	void init() throws IOException {
		fdbctr = fdbctrEventTestUtils.getEventDataByFileName("FdbCtrEventFileTest", FDBCTR.class);
		fdbctrEnriched = fdbctrEventTestUtils.getEventDataByFileName("FdbCtrEventEnrichedFileTest", FDBCTR.class);
	}

	@Test
	void Should_EnricheFdbctr_When_calledWithAGivenEventData() {
		fdbCtrEventEnricher.enrich(fdbctr);
		assertEquals(fdbctrEnriched, fdbctr);
	}

	public static class Config {
		@Bean
		FdbtabProvider fdbtabProvider() {
			Fdbtab fdbtab = new Fdbtab();
			fdbtab.setTbid("040");
			fdbtab.setTbcomp("MAD");
			fdbtab.setTbcode("95523");
			fdbtab.setTbdes1("libelle_produit");
			FdbtabProvider fdbtabProvider = Mockito.mock(FdbtabProvider.class);
			Mockito.when(fdbtabProvider.getFdbtabByTbidAndTbcode(ArgumentMatchers.anyString(), ArgumentMatchers.any()))
					.thenReturn(java.util.Optional.of(fdbtab));
			return fdbtabProvider;
		}

		@Bean
		EventTypeProvider eventTypeObjectProvider() {
			return new EventTypeProviderImpl();
		}
	}
}
