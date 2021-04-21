package ma.cdgk.infra.eventenricher;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.events.oly.FDBBSA;
import ma.cdgk.domain.util.Utils;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbBsaEventEnricher implements EventEnricher<FDBBSA> {

	private final UtilService utilService;

	@Override
	public FDBBSA enrich(FDBBSA event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbBsaAddOrUpdateEvent);
		event.setBsmntc(ObjectUtils.isNotEmpty(event.getBsmntc()) ? event.getBsmntc().replace(",", ".") : "0.0");
		event.setBsmntint(ObjectUtils.isNotEmpty(event.getBsmntint()) ? event.getBsmntint().replace(",", ".") : "0.0");
		event.setDateFinTombee(getDateFinTombee(event));
		event.setEventType(eventType);

		return event;
	}

	private String getDateFinTombee(FDBBSA event) {
		return Utils.transformDateOrDefault(event.getBsdtech(), "dd/MM/yyyy");
	}

}
