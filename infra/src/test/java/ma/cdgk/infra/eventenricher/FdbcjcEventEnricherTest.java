package ma.cdgk.infra.eventenricher;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

import java.io.IOException;
import java.util.Optional;
import ma.cdgcapital.avro.oly.FDBCJC;
import ma.cdgk.domain.entities.Fdblop;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.infra.EventTestUtils;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdblopProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = EventTestUtils.class)
class FdbcjcEventEnricherTest {

	@Mock
	private UtilService utilService;
	@Mock
	private FdbnumProvider fdbnumProvider;
	@Mock
	private FdblopProvider fdblopProvider;
	@Mock
	private FdbcliProvider fdbcliProvider;
	@Mock
	private FdbtabProvider fdbtabProvider;

	@InjectMocks
	private FdbcjcEventEnricher fdbcjcEventEnricher;

	@Autowired
	private EventTestUtils<FDBCJC> eventTestUtils;
	private FDBCJC fdbcjc;
	private FDBCJC enrichedFdbcjc;

	@BeforeEach
	public void init() throws IOException {
		fdbcjc = eventTestUtils.getEventDataByEventClass(FDBCJC.class);
		when(utilService.getEventType(any())).thenReturn("FDBCJC");
	}

	@Test
	void Should_enrichEventWithOperationData() throws IOException {
		enrichedFdbcjc = eventTestUtils.getEnrichedEventDataByEventClass(FDBCJC.class);
		initOperationData();

		fdbcjcEventEnricher.enrich(fdbcjc);

		assertThat(fdbcjc).usingRecursiveComparison().ignoringExpectedNullFields().isEqualTo(enrichedFdbcjc);
	}

	@Test
	void Should_enrichEventWithoutOperationData() throws IOException {
		enrichedFdbcjc = eventTestUtils.getEventDataByEventClass(FDBCJC.class);
		enrichedFdbcjc.setEventType("FDBCJC");
		when(fdblopProvider.getOperationByByOpidAndOpnope(anyString(), anyString())).thenReturn(Optional.empty());

		fdbcjcEventEnricher.enrich(fdbcjc);

		assertThat(fdbcjc).usingRecursiveComparison().ignoringExpectedNullFields().isEqualTo(enrichedFdbcjc);
	}

	private void initOperationData() {

		Fdblop mockedFdblop = Fdblop.builder().opid("120").opbia1("description").opbia2("From").opbia3("Fdblop")
				.opbia4("Event").opagce("codeAgence").opdbrc("111").opdbgr("222").opdbru("333").opdbnm("444")
				.opcrrc("100").opcrgr("200").opcrru("300").opcrnm("400").opvref("ref").opdbao("MAD").opdcpr("segProd")
				.build();

		Fdbnum mockedFdbnum = new Fdbnum();
		mockedFdbnum.setNurefe("nurefe from fdbnum");

		when(fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(anyString(), anyString(), anyString(),
				anyString(), anyString())).thenReturn(Optional.of(mockedFdbnum));
		when(utilService.changeDateFormatFdblop(any())).thenReturn("20-02-2020");
		when(utilService.changeDateFormatFdblopTypeOperation(any())).thenReturn("11-02-2020");
		when(fdblopProvider.getOperationByByOpidAndOpnope(anyString(), anyString()))
				.thenReturn(Optional.ofNullable(mockedFdblop));
	}
}
