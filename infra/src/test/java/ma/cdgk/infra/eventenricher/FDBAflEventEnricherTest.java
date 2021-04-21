package ma.cdgk.infra.eventenricher;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBAFL;
import ma.cdgk.infra.TestBaseConfig;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.infra.utils.UtilServiceImpl;
import ma.cdgk.producer.starter.domain.eventType.EventTypeProvider;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {TestBaseConfig.class, FdbAflEventEnricher.class, FDBAflEventEnricherTest.Config.class,
		UtilServiceImpl.class})
class FDBAflEventEnricherTest {

	@Autowired
	FdbAflEventEnricher fdbAflEventEnricher;

	FDBAFL fdbafl;

	@BeforeEach
	void init() throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
		this.fdbafl = new FDBAFL();
		this.fdbafl.setAfrefa("90001064329990010000");
		this.fdbafl.setAfdtsy("270114");
	}

	@Test
	void enrich_Should_Add_EventType_To_FDBAFL() {
		Assertions.assertNull(fdbafl.getEventType());
		fdbAflEventEnricher.enrich(fdbafl);
		Assertions.assertEquals("OLY.FDBAFL", fdbafl.getEventType());
	}

	@Test
	void enrich_Should_Add_NumeroCompte_To_FDBAFL() {
		Assertions.assertNull(fdbafl.getNumeroCompte());
		fdbAflEventEnricher.enrich(fdbafl);
		Assertions.assertEquals("9000106432999001", fdbafl.getNumeroCompte());
	}

	@Test
	void enrich_Should_Add_Devise_To_FDBAFL() {
		Assertions.assertNull(fdbafl.getDevise());
		fdbAflEventEnricher.enrich(fdbafl);
		Assertions.assertEquals("TBC", fdbafl.getDevise());
	}

	@Test
	void enrich_Should_Add_DateDernierMouvement_To_FDBAFL() {
		Assertions.assertNull(fdbafl.getDateDernierMouvement());
		fdbAflEventEnricher.enrich(fdbafl);
		Assertions.assertEquals("27-01-2014", fdbafl.getDateDernierMouvement());
	}

	public static class Config {

		@Bean
		EventTypeProvider eventTypeObjectProvider() {
			return new EventTypeProviderImpl();
		}

		@Bean
		FdbtabProvider fdbtabProvider() {
			Fdbtab fdbtab = new Fdbtab();
			fdbtab.setTbcode("TbCodeMocked");
			fdbtab.setTbdes3("tbdes3Mockedtbdes3Mockedtbdes3Mocked");
			fdbtab.setTbdes4("tbdes4Mockedtbdes4Mocked");
			fdbtab.setTbcomp("TBCOMMOCKED");
			FdbtabProvider fdbtabProvider = Mockito.mock(FdbtabProvider.class);
			Mockito.when(fdbtabProvider.getFdbtabByTbidAndTbcode(ArgumentMatchers.anyString(), ArgumentMatchers.any()))
					.thenReturn(java.util.Optional.of(fdbtab));
			return fdbtabProvider;
		}
	}
}
