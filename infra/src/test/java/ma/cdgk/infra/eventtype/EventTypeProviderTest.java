package ma.cdgk.infra.eventtype;

import static org.assertj.core.api.Assertions.assertThat;

import ma.cdgcapital.avro.oly.FDBCJC;
import ma.cdgk.domain.events.oly.FDBCLI;
import ma.cdgk.domain.events.oly.FDBCPT;
import ma.cdgk.domain.events.oly.FDBLOP;
import ma.cdgk.domain.events.oly.FDBMVT;
import ma.cdgk.infra.eventenricher.*;
import ma.cdgk.infra.keyprovider.*;
import ma.cdgk.producer.starter.domain.eventType.EventType;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {EventTypeProviderTest.class, EventTypeProviderImpl.class})
class EventTypeProviderTest {
	@Autowired
	EventTypeProviderImpl eventTypeProvider;

	private static EventType fdblopType = new EventType("FDBLOP_INSERT_OR_UPDATE", FDBLOP.class,
			FdbLopEventEnricher.class, FdbLopKeyProvider.class, "FDBLOP", "FDBLOP");
	private static EventType fdbcptType = new EventType("FDBCPT_INSERT_OR_UPDATE", FDBCPT.class,
			FdbCptEventEnricher.class, FdbCptKeyProvider.class, "FDBCPT", "FDBCPT");
	private static EventType fdbmvtType = new EventType("FDBMVT_INSERT_OR_UPDATE", FDBMVT.class,
			FdbMvtEventEnricher.class, FdbMvtKeyProvider.class, "FDBMVT", "FDBMVT");
	private static final EventType fdbCliEvent = new EventType("FDBCLI_INSERT_OR_UPDATE", FDBCLI.class,
			FdbCliEventEnricher.class, FdbCliKeyProvider.class, "FDBCLI", "FDBCLI");
	private static final EventType fdbcjcEvent = new EventType("FDBCJC_INSERT_OR_UPDATE", FDBCJC.class,
			FdbcjcEventEnricher.class, FdbcjcKeyProvider.class, "FDBCJC", "FDBCJC");

	@Test
	void given_Code_Execpt_Event_Type() {

		assertThat(eventTypeProvider.getEventType("FDBCPT_INSERT_OR_UPDATE")).usingRecursiveComparison()
				.isEqualTo(fdbcptType);

		assertThat(eventTypeProvider.getEventType("FDBLOP_INSERT_OR_UPDATE")).usingRecursiveComparison()
				.isEqualTo(fdblopType);

		assertThat(eventTypeProvider.getEventType("FDBMVT_INSERT_OR_UPDATE")).usingRecursiveComparison()
				.isEqualTo(fdbmvtType);

		assertThat(eventTypeProvider.getEventType("FDBCLI_INSERT_OR_UPDATE")).usingRecursiveComparison()
				.isEqualTo(fdbCliEvent);

		assertThat(eventTypeProvider.getEventType("FDBCJC_INSERT_OR_UPDATE")).usingRecursiveComparison()
				.isEqualTo(fdbcjcEvent);
	}

	@Test
	void given_InvalidCode_Expect_IllegalArgumentException() {
		Assert.assertThrows(IllegalArgumentException.class, () -> {
			eventTypeProvider.getEventType("cc");
		});
	}
}
