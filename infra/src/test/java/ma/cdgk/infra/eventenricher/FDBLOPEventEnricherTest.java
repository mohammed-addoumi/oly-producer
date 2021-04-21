package ma.cdgk.infra.eventenricher;

import java.io.IOException;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBLOP;
import ma.cdgk.events.oly.FdbCliType;
import ma.cdgk.events.oly.OperationStatut;
import ma.cdgk.events.oly.OperationType;
import ma.cdgk.infra.EventTestUtils;
import ma.cdgk.infra.TestBaseConfig;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
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
@ContextConfiguration(classes = {TestBaseConfig.class, FdbLopEventEnricher.class, FDBLOPEventEnricherTest.Config.class,
		UtilServiceImpl.class, EventTestUtils.class})
class FDBLOPEventEnricherTest {

	@Autowired
	FdbLopEventEnricher fdbLopEventEnricher;
	@Autowired
	private EventTestUtils<FDBLOP> fdbctrEventTestUtils;
	FDBLOP fdblop;

	@BeforeEach
	void init() throws IOException {
		this.fdblop = fdbctrEventTestUtils.getEventDataByFileName("FdbLopEventFileTest", FDBLOP.class);
	}

	@Test
	void enrich_Should_Add_AddressClientDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getAdresseClientDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("Address2 Mocked Address3 Mocked Address4 Mocked Address5 Mocked Address6 Mocked",
				fdblop.getAdresseClientDebit());
	}

	@Test
	void enrich_Should_Add_NomClientDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getNomClientDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("", fdblop.getNomClientDebit());
	}

	@Test
	void enrich_Should_Add_TypeClientDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getTypeClientDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals(FdbCliType.PERSONNE_PHYSIQUE.toString(), fdblop.getTypeClientDebit());
	}

	@Test
	void enrich_Should_Add_NumeroCompteDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getNumeroCompteDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("5003539001000001", fdblop.getNumeroCompteDebit());
	}

	@Test
	void enrich_Should_Add_RibDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getRibDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("TestNurefeMocked", fdblop.getRibDebit());
	}

	@Test
	void enrich_Should_Add_DeviseDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getDeviseDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("MAD", fdblop.getDeviseDebit());
	}

	@Test
	void enrich_Should_Add_DateValeurDebit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getDateValeurDebit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("24-04-2020", fdblop.getDateValeurDebit());
	}

	@Test
	void enrich_Should_Add_AddressClientCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getAdresseClientCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("Address2 Mocked Address3 Mocked Address4 Mocked Address5 Mocked Address6 Mocked",
				fdblop.getAdresseClientCredit());
	}

	@Test
	void enrich_Should_Add_NomClientCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getNomClientCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("", fdblop.getNomClientCredit());
	}

	@Test
	void enrich_Should_Add_TypeClientCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getTypeClientCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals(FdbCliType.PERSONNE_PHYSIQUE.toString(), fdblop.getTypeClientCredit());
	}

	@Test
	void enrich_Should_Add_NumeroCompteCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getNumeroCompteCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("0000001388110001", fdblop.getNumeroCompteCredit());
	}

	@Test
	void enrich_Should_Add_RibCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getRibCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("TestNurefeMocked", fdblop.getRibCredit());
	}

	@Test
	void enrich_Should_Add_DeviseCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getDeviseCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("MAD", fdblop.getDeviseCredit());
	}

	@Test
	void enrich_Should_Add_DateValeurCredit_To_FDBLOP() {
		Assertions.assertNull(fdblop.getDateValeurCredit());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("24-04-2020", fdblop.getDateValeurCredit());
	}

	@Test
	void enrich_Should_Add_DateOperation_To_FDBLOP() {
		Assertions.assertNull(fdblop.getDateOperation());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("27-04-2020", fdblop.getDateOperation());
	}

	@Test
	void enrich_Should_Add_TypeOperation_To_FDBLOP() {
		Assertions.assertNull(fdblop.getTypeOperation());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals(OperationType.ORDRE_BOURSE.toString(), fdblop.getTypeOperation());
	}

	@Test
	void enrich_Should_Add_StatutOperation_To_FDBLOP() {
		Assertions.assertNull(fdblop.getStatutOperation());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals(OperationStatut.EXECUTE.toString(), fdblop.getStatutOperation());
	}

	@Test
	void enrich_Should_Add_EventType_To_FDBLOP() {
		Assertions.assertNull(fdblop.getEventType());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("OLY.FDBLOP", fdblop.getEventType());
	}

	@Test
	void enrich_Should_Add_ReferenceOperation_To_FDBLOP() {
		String OPID = "931";
		String OPNOPE = "0000063134";
		String expectedReference = "931-0000063134";
		fdblop.setOpid(OPID);
		fdblop.setOpnope(OPNOPE);
		Assertions.assertNull(fdblop.getReferenceOperation());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals(expectedReference, fdblop.getReferenceOperation());
	}

	@Test
	void enrich_Should_Add_TypeOperationLibelle_To_FDBLOP() {
		Assertions.assertNull(fdblop.getTypeOperationLibelle());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("Tbdes1Mocked", fdblop.getTypeOperationLibelle());
	}

	@Test
	void enrich_Should_Add_Libelle_To_FDBLOP() {
		Assertions.assertNull(fdblop.getLibelle());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("OPBIA1Test OPBIA2Test OPBIA3Test OPBIA4Test", fdblop.getLibelle());
	}

	@Test
	void enrich_Should_Add_IdSourceOperation_To_FDBLOP() {
		Assertions.assertNull(fdblop.getIdSourceOperation());
		fdbLopEventEnricher.enrich(fdblop);
		Assertions.assertEquals("02009300530", fdblop.getIdSourceOperation());
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
			fdbtab.setTbdes1("Tbdes1Mocked");
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
