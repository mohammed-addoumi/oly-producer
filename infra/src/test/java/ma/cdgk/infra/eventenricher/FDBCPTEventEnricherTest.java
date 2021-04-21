package ma.cdgk.infra.eventenricher;

import java.io.IOException;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.FdbcptStatut;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBCPT;
import ma.cdgk.events.oly.FdbCliType;
import ma.cdgk.infra.EventTestUtils;
import ma.cdgk.infra.TestBaseConfig;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.infra.utils.UtilServiceImpl;
import ma.cdgk.producer.starter.domain.eventType.EventTypeProvider;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {TestBaseConfig.class, FdbCptEventEnricher.class, UtilServiceImpl.class,
		EventTestUtils.class, FDBCPTEventEnricherTest.Config.class})
class FDBCPTEventEnricherTest {

	@Autowired
	private UtilService utilService;
	@Autowired
	FdbCptEventEnricher fdbCptEventEnricher;

	@Autowired
	FdbnumProvider fdbnumProvider;
	@Autowired
	private EventTestUtils<FDBCPT> fdbcptEventTestUtils;

	FDBCPT fdbcpt;

	@BeforeEach
	void init() throws IOException {
		this.fdbcpt = fdbcptEventTestUtils.getEventDataByFileName("FdbCptEventFileTest", FDBCPT.class);
	}

	@Test
	void Should_AddRibToFdbcpt() {
		Assertions.assertNull(fdbcpt.getRib());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("TestNurefeMocked", fdbcpt.getRib());
	}

	@Test
	@DisplayName("Doit enrichir par ")
	void Should_AddEventTypeToFdbcpt() {
		Assertions.assertNull(fdbcpt.getEventType());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("OLY.FDBCPT", fdbcpt.getEventType());
	}

	@Test
	void enrich_Should_Add_Type_Client_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getTypeClient());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals(FdbCliType.PERSONNE_PHYSIQUE.toString(), fdbcpt.getTypeClient());
	}

	@Test
	void enrich_Should_Add_Address_Client_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getAdresseClient());
		fdbCptEventEnricher.enrich(fdbcpt);
		String expectedAddress = "Address2 Mocked Address3 Mocked Address4 Mocked Address5 Mocked Address6 Mocked";
		Assertions.assertEquals(expectedAddress, fdbcpt.getAdresseClient());
	}

	@Test
	void enrich_Should_Add_Devise_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getDevise());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("TBC", fdbcpt.getDevise());
	}

	@Test
	void enrich_Should_Add_Account_Number_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getNumeroCompte());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("5003534002001002", fdbcpt.getNumeroCompte());
	}

	@Test
	void enrich_Should_Add_Agence_Code_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getCodeAgence());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("TbCodeMocked", fdbcpt.getCodeAgence());
	}

	@Test
	void enrich_Should_Add_Agence_Name_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getNomAgence());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("3Mockedtbdes4Mockedtbdes4Mo", fdbcpt.getNomAgence());
	}

	@Test
	void enrich_Should_Add_Intitule_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getIntitule());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("FCP CDG MULTIGESTION", fdbcpt.getIntitule());
	}

	@Test
	void enrich_Should_Add_Iban_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getIban());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("TestNurefeMocked", fdbcpt.getIban());
	}

	@Test
	void enrich_Should_Add_Status_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getStatut());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals(FdbcptStatut.ACTIF.toString(), fdbcpt.getStatut());
	}

	@Test
	void enrich_Should_Add_DateDernierMouvement_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getDateDernierMouvement());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("29-04-2020", fdbcpt.getDateDernierMouvement());
	}

	@Test
	void enrich_Should_Add_DateValeurDernierMouvement_To_Fdbcpt() {
		Assertions.assertNull(fdbcpt.getDateValeurDernierMouvement());
		fdbCptEventEnricher.enrich(fdbcpt);
		Assertions.assertEquals("01-06-2020", fdbcpt.getDateValeurDernierMouvement());
	}

	public static class Config {

		@Bean
		FdbcliProvider fdbcliProvider() {
			Fdbcli fdbcli = new Fdbcli();

			fdbcli.setClad02("Address2 Mocked");
			fdbcli.setClad03("Address3 Mocked");
			fdbcli.setClad04("Address4 Mocked");
			fdbcli.setClad05("Address5 Mocked");
			fdbcli.setClad06("Address6 Mocked");
			fdbcli.setCltype("A");

			FdbcliProvider fdbcliProvider = Mockito.mock(FdbcliProvider.class);
			Mockito.when(fdbcliProvider.getClientByClraci(ArgumentMatchers.anyString()))
					.thenReturn(java.util.Optional.ofNullable(fdbcli));

			return fdbcliProvider;
		}

		@Bean
		FdbnumProvider fdbnumProvider() {
			Fdbnum fdbnum = Mockito.mock(Fdbnum.class);
			Mockito.when(fdbnum.getNurefe()).thenReturn("TestNurefeMocked");

			FdbnumProvider fdbnumProvider = Mockito.mock(FdbnumProvider.class);
			Mockito.when(fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(ArgumentMatchers.anyString(),
					ArgumentMatchers.anyString(), ArgumentMatchers.anyString(), ArgumentMatchers.anyString(),
					ArgumentMatchers.anyString())).thenReturn(java.util.Optional.of(fdbnum));

			return fdbnumProvider;
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

		@Bean
		EventTypeProvider eventTypeObjectProvider() {
			return new EventTypeProviderImpl();
		}
	}
}
