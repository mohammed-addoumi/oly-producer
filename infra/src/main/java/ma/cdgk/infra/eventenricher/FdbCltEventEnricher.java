package ma.cdgk.infra.eventenricher;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.events.oly.FDBCLT;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbCltEventEnricher implements EventEnricher<FDBCLT> {

	private final UtilService utilService;

	@Override
	public FDBCLT enrich(FDBCLT event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbcltAddOrUpdateEvent);

		event.setEventType(eventType);

		return event;
	}
}
