package ma.cdgk.infra.eventtype;

import static org.assertj.core.api.Assertions.assertThat;

import ma.cdgk.infra.eventenricher.*;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricherFactory;
import ma.cdgk.producer.starter.domain.eventType.EventType;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {EventEnricherFactoryImpl.class, TestConfig.class})
class EventEnricherFactoryTest {

	@Autowired
	private EventEnricherFactory eventEnricherFactory;

	@Mock
	private EventType fdbCptEventTypeObject;

	@Mock
	private EventType fdbLopeventTypeObject;

	@Mock
	private EventType fdbMvteventTypeObject;

	@Mock
	private EventType fdbCtrEventTypeObject;

	@Mock
	private EventType fdbcjcEventTypeObject;

	@Test
	void given_FdbCptAddOrUpdateEvent_Expect_FdbCptEventEnricher() {

		this.fdbCptEventTypeObject = EventType.builder().enricherServiceClassName(FdbCptEventEnricher.class).build();

		EventEnricher<Object> eventEnricher = eventEnricherFactory.getEnricher(fdbCptEventTypeObject);

		assertThat(eventEnricher).isNotNull();
		assertThat(eventEnricher.getClass().getName()).containsIgnoringCase(FdbCptEventEnricher.class.getName());
	}

	@Test
	void given_FdbLopAddOrUpdateEvent_Expect_FdbLopEventEnricher() {

		this.fdbLopeventTypeObject = EventType.builder().enricherServiceClassName(FdbLopEventEnricher.class).build();

		EventEnricher<Object> eventEnricher = eventEnricherFactory.getEnricher(fdbLopeventTypeObject);

		assertThat(eventEnricher).isNotNull();
		assertThat(eventEnricher.getClass().getName()).containsIgnoringCase(FdbLopEventEnricher.class.getName());
	}

	@Test
	void given_FdbMvtAddOrUpdateEvent_Expect_FdbMvtEventEnricher() {

		this.fdbMvteventTypeObject = EventType.builder().enricherServiceClassName(FdbMvtEventEnricher.class).build();

		EventEnricher<Object> eventEnricher = eventEnricherFactory.getEnricher(fdbMvteventTypeObject);

		assertThat(eventEnricher).isNotNull();
		assertThat(eventEnricher.getClass().getName()).containsIgnoringCase(FdbMvtEventEnricher.class.getName());
	}

	@Test
	void Should_EventEnricherFactoryCallFdbCtrEventEnricher_When_TheFdbCtrEventGetCalled() {

		this.fdbCtrEventTypeObject = EventType.builder().enricherServiceClassName(FdbCtrEventEnricher.class).build();

		EventEnricher<Object> eventEnricher = eventEnricherFactory.getEnricher(fdbCtrEventTypeObject);

		assertThat(eventEnricher).isNotNull();
		assertThat(eventEnricher.getClass().getName()).containsIgnoringCase(FdbCtrEventEnricher.class.getName());
	}

	@Test
	void Should_EventEnricherFactoryCallFdbcjcEventEnricher_When_TheFdbcjcEventGetCalled() {

		this.fdbcjcEventTypeObject = EventType.builder().enricherServiceClassName(FdbcjcEventEnricher.class).build();

		EventEnricher<Object> eventEnricher = eventEnricherFactory.getEnricher(fdbcjcEventTypeObject);

		assertThat(eventEnricher).isNotNull();
		assertThat(eventEnricher.getClass().getName()).containsIgnoringCase(FdbcjcEventEnricher.class.getName());
	}
}
