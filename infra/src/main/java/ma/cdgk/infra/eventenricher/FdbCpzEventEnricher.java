package ma.cdgk.infra.eventenricher;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.events.oly.FDBCPZ;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbCpzEventEnricher implements EventEnricher<FDBCPZ> {

	private final UtilService utilService;

	@Override
	public FDBCPZ enrich(FDBCPZ event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbcpzAddOrUpdateEvent);
		String numeroCompte = getNumeroCompte(event);
		event.setEventType(eventType);
		event.setNumeroCompte(numeroCompte);

		return event;
	}

	private String getNumeroCompte(FDBCPZ event) {
		return event.getCpzrac() + event.getCpzgre() + event.getCpzrub() + event.getCpzmon();
	}
}
