package ma.cdgk.infra.eventenricher;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.when;

import java.io.IOException;
import java.util.Optional;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.Fdblop;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBMVT;
import ma.cdgk.infra.EventTestUtils;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdblopProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {EventTestUtils.class})
class FDBMVTEventEnricherTest {

	@InjectMocks
	private FdbMvtEventEnricher fdbMvtEventEnricher;

	@Mock
	private FdblopProvider fdblopProvider;
	@Mock
	private FdbnumProvider fdbnumProvider;
	@Mock
	private FdbtabProvider fdbtabProvider;
	@Mock
	private FdbcliProvider fdbcliProvider;
	@Mock
	private UtilService utilService;

	@Autowired
	private EventTestUtils<FDBMVT> fdbmvtEventTestUtils;

	private FDBMVT fdbmvt;
	private FDBMVT enrichedFdbmvt;

	@BeforeEach
	void init() throws IOException {
		this.fdbmvt = fdbmvtEventTestUtils.getEventDataByFileName("FdbMvtEventFileTest", FDBMVT.class);
		this.enrichedFdbmvt = fdbmvtEventTestUtils.getEventDataByFileName("FdbMvtEventEnrichedFileTest", FDBMVT.class);

		fdbmvt = fdbmvtEventTestUtils.getEventDataByEventClass(FDBMVT.class);
		when(utilService.getEventType(any())).thenReturn("OLY.FDBMVT");
	}

	@Test
	void Should_EnricheFdbMvt() {
		initOperationData();

		fdbMvtEventEnricher.enrich(fdbmvt);
		assertThat(enrichedFdbmvt).usingRecursiveComparison().isEqualTo(fdbmvt);
	}

	private void initOperationData() {

		mockFdbLopProvider();
		mockFdbNumProvider();
		mockFdbTabProvider();
		mockFdbCliProvider();
	}

	private void mockFdbCliProvider() {
		Fdbcli fdbcli = new Fdbcli();
		fdbcli.setCltype("A");
		fdbcli.setClnomc("ClientNameMocked");

		when(fdbcliProvider.getClientByClraci(ArgumentMatchers.anyString())).thenReturn(Optional.of(fdbcli));
	}

	private void mockFdbTabProvider() {
		Fdbtab fdbtab = new Fdbtab();
		fdbtab.setTbcomp("MAD 000");
		fdbtab.setTbdes1("Tbdes1Mocked");

		when(fdbtabProvider.getFdbtabByTbidAndTbcode(ArgumentMatchers.anyString(), ArgumentMatchers.any()))
				.thenReturn(Optional.of(fdbtab));
	}

	private void mockFdbNumProvider() {
		Fdbnum fdbnum = Mockito.mock(Fdbnum.class);
		when(fdbnum.getNurefe()).thenReturn("NurefeMocked");
		when(fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(ArgumentMatchers.anyString(),
				ArgumentMatchers.anyString(), ArgumentMatchers.anyString(), ArgumentMatchers.anyString(),
				ArgumentMatchers.anyString())).thenReturn(Optional.of(fdbnum));
	}

	private void mockFdbLopProvider() {
		Fdblop mockedFdblop = Fdblop.builder().opbia1("description").opbia2("From").opbia3("Fdblop").opbia4("Event")
				.opagce("codeAgence").opdbrc("111").opdbgr("222").opdbru("333").opdbnm("444").opcrrc("100")
				.opcrgr("200").opcrru("300").opcrnm("400").opvref("ref").opdbao("MAD").opdcpr("segProd").build();

		when(fdblopProvider.getOperationByOpidAndLplref(anyString(), anyLong()))
				.thenReturn(Optional.ofNullable(mockedFdblop));
	}
}
