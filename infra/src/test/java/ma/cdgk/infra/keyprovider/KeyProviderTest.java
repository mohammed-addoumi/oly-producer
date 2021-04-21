package ma.cdgk.infra.keyprovider;

import ma.cdgcapital.avro.oly.FDBCJC;
import ma.cdgk.domain.events.oly.FDBCPT;
import ma.cdgk.domain.events.oly.FDBCTR;
import ma.cdgk.domain.events.oly.FDBLOP;
import ma.cdgk.domain.events.oly.FDBMVT;
import ma.cdgk.producer.starter.domain.keyprovider.KeyProvider;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {KeyProviderTest.class, FdbCptKeyProvider.class, FdbLopKeyProvider.class,
		FdbMvtKeyProvider.class, FdbCtrKeyProvider.class, FdbcjcKeyProvider.class})
class KeyProviderTest {

	static String NUMBER_DEBITED_ACCOUNT_MOCKED = "NumeroDeCompteDebitMock";
	static String NUMBER_ACCOUNT_FDBCPT_MOCKED = "NumeroCOmpTEMockED";
	static String NUMBER_MOVEMENT_FDBMVT_MOCKED = "NumeroMouvementMocked";
	static String FDBCJC_CJCNOPE_MOCKED = "cjcnop";
	static String FDBCJC_CJCCOPE_MOCKED = "cjccop";
	static String FDBCTR_ID_CONTRAT = "10024931";

	@Autowired
	KeyProvider<FDBLOP> fdbLopKeyProvider;
	@Autowired
	KeyProvider<FDBCPT> fdbCptKeyProvider;
	@Autowired
	KeyProvider<FDBMVT> fdbmvtKeyProvider;
	@Autowired
	KeyProvider<FDBCTR> fdbctrKeyProvider;
	@Autowired
	KeyProvider<FDBCJC> fdbcjcKeyProvider;

	@Mock
	FDBLOP fdblop;
	@Mock
	FDBCPT fdbcpt;
	@Mock
	FDBMVT fdbmvt;
	@Mock
	FDBCTR fdbctr;
	@Mock
	FDBCJC fdbcjc;

	@BeforeEach
	void init() {
		Mockito.when(fdblop.getNumeroCompteDebit()).thenReturn(NUMBER_DEBITED_ACCOUNT_MOCKED);
		Mockito.when(fdbcpt.getNumeroCompte()).thenReturn(NUMBER_ACCOUNT_FDBCPT_MOCKED);
		Mockito.when(fdbmvt.getNumeroCompte()).thenReturn(NUMBER_MOVEMENT_FDBMVT_MOCKED);
		Mockito.when(fdbctr.getIdContrat()).thenReturn(FDBCTR_ID_CONTRAT);
		Mockito.when(fdbctr.getIdContrat()).thenReturn(FDBCTR_ID_CONTRAT);
		Mockito.when(fdbcjc.getCjccope()).thenReturn(FDBCJC_CJCCOPE_MOCKED);
		Mockito.when(fdbcjc.getCjcnope()).thenReturn(FDBCJC_CJCNOPE_MOCKED);
	}

	@Test
	void getKey_Should_Return_Number_Debited_Account_When_Give_fdbLopEvent() {
		Assertions.assertNotNull(fdbLopKeyProvider);
		Assertions.assertEquals(NUMBER_DEBITED_ACCOUNT_MOCKED, fdbLopKeyProvider.getKey(fdblop));
	}

	@Test
	void getKey_Should_Return_Number_Debited_Account_When_Give_fdbcmtEvent() {
		Assertions.assertNotNull(fdbCptKeyProvider);
		Assertions.assertEquals(NUMBER_ACCOUNT_FDBCPT_MOCKED, fdbCptKeyProvider.getKey(fdbcpt));
	}

	@Test
	void getKey_Should_Return_Number_Mouvement_When_Give_fdbmvtEvent() {
		Assertions.assertNotNull(fdbCptKeyProvider);
		Assertions.assertEquals(NUMBER_MOVEMENT_FDBMVT_MOCKED, fdbmvtKeyProvider.getKey(fdbmvt));
	}

	@Test
	void Should_ProvideTheCorrectKey_When_CallFdbctrEvent() {
		Assertions.assertNotNull(fdbctrKeyProvider);
		Assertions.assertEquals(FDBCTR_ID_CONTRAT, fdbctrKeyProvider.getKey(fdbctr));
	}

	@Test
	void Should_ProvideTheCorrectKey_When_CallCreComptqbleEvent() {
		Assertions.assertNotNull(fdbcjcKeyProvider);
		Assertions.assertEquals(FDBCJC_CJCCOPE_MOCKED + "-" + FDBCJC_CJCNOPE_MOCKED, fdbcjcKeyProvider.getKey(fdbcjc));
	}
}
