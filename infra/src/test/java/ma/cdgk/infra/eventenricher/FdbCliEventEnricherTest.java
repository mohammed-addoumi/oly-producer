package ma.cdgk.infra.eventenricher;

import static org.assertj.core.api.Assertions.assertThat;

import ma.cdgk.domain.events.oly.FDBCLI;
import ma.cdgk.infra.TestBaseConfig;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.utils.UtilServiceImpl;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = {FdbCliEventEnricher.class, UtilServiceImpl.class, Utils.class, TestBaseConfig.class,
		EventTypeProviderImpl.class})
class FdbCliEventEnricherTest {

	@Autowired
	EventEnricher enricher;

	FDBCLI fdbcli;

	@BeforeEach
	void init() {
		fdbcli = new FDBCLI();
		fdbcli.setClad02("address02");
		fdbcli.setClad03("address03");
		fdbcli.setClad04("address04");
		fdbcli.setClad05("address05");
		fdbcli.setClad06("address06");
		fdbcli.setClgest("");
		fdbcli.setCldtmu("");
	}

	@Test
	void Should_LoadEnricher() {
		assertThat(enricher).isNotNull();
	}

	@Test
	void Should_EnrichWithEventType_When_GiveFDBCLI() {
		assertThat(fdbcli.getEventType()).isNull();
		enricher.enrich(fdbcli);
		String expectedEventType = "OLY.FDBCLI";
		assertThat(fdbcli.getEventType()).isNotNull().isEqualTo(expectedEventType);
	}

	@Test
	void Should_EnrichWithClientAddress_When_GiveFDBCLI() {
		assertThat(fdbcli.getAdresseClient()).isNull();
		enricher.enrich(fdbcli);
		String expectedAddress = "address02 address03 address04 address05 address06";
		assertThat(fdbcli.getAdresseClient()).isNotNull().isEqualTo(expectedAddress);
	}

	@ParameterizedTest
	@CsvSource({"aeaz   ,  NOTFOUND", "I  ,     INTERNE", "A  ,     PERSONNE_PHYSIQUE"})
	void Should_EnrichWithClientType_When_GiveFDBCLI(String actualType, String expectedType) {
		fdbcli.setCltype(actualType);
		enricher.enrich(fdbcli);
		assertThat(fdbcli.getTypeClient()).isNotNull().isEqualTo(expectedType);
	}

	@ParameterizedTest
	@CsvSource({"Blanc   , ACTIF", "R  ,      ACTIF_A_RETENIR", "A  ,      ANNULEE", "azen,     NOTFOUND"})
	void Should_EnrichWithCodeExpedition_When_GiveFDBCLI(String actualCodeExpedition, String expectedExpedition) {
		fdbcli.setClcdex(actualCodeExpedition);
		enricher.enrich(fdbcli);
		assertThat(fdbcli.getCodeExpedition()).isNotNull().isEqualTo(expectedExpedition);
	}

	@ParameterizedTest
	@CsvSource({"C, CELEBATAIRE", "D, DIVORCE", "M, MARIE", "S, SEPARE", "V, VEUF", "aza , NOTFOUND", "axzo, NOTFOUND"})
	void Should_EnrichWithEtatCivil_When_GiveFDBCLI(String actualCode, String expectedEtatCivil) {
		fdbcli.setCletcv(actualCode);
		enricher.enrich(fdbcli);
		assertThat(fdbcli.getEtatCivil()).isNotNull().isEqualTo(expectedEtatCivil);
	}

	@Test
	void Should_EnrichWithDateOuverture_When_GiveFDBCLI() {
		fdbcli.setCldtou("021112");
		enricher.enrich(fdbcli);
		assertThat(fdbcli.getDateOuverture()).isNotNull().isEqualTo("02-11-2012");
	}

	@Test
	void Should_EnrichWithDateDerniereModification_When_GiveFDBCLI() {
		fdbcli.setCldtmu("021112");
		enricher.enrich(fdbcli);
		assertThat(fdbcli.getDateDerniereModification()).isNotNull().isEqualTo("02-11-2012");
	}

	@ParameterizedTest
	@CsvSource({"R, RESTRECTIVE", "L, LIBRE", "aza, NOT_FOUND"})
	void Should_EnrichWithTypeGestion(String actualCode, String expectedTypeGestion) {
		fdbcli.setClgest(actualCode);
		enricher.enrich(fdbcli);
		assertThat(fdbcli.getTypeGestion()).isNotNull().isEqualTo(expectedTypeGestion);
	}

}
