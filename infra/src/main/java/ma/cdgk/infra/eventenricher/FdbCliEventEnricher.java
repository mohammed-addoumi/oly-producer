package ma.cdgk.infra.eventenricher;

import static ma.cdgk.infra.eventenricher.Utils.changeDateFormat;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.events.oly.FDBCLI;
import ma.cdgk.events.oly.FdbCliCodeExpedition;
import ma.cdgk.events.oly.FdbCliEtatCivil;
import ma.cdgk.events.oly.FdbCliType;
import ma.cdgk.events.oly.FdbCliTypeGesion;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import ma.cdgk.producer.starter.domain.utils.Utils;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbCliEventEnricher implements EventEnricher<FDBCLI> {

	private final UtilService utilService;

	@Override
	public FDBCLI enrich(FDBCLI event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbCliAddOrUpdateEvent);
		String addressClient = getAdresseClient(event);
		String clientType = getTypeClient(event.getCltype());
		String codeExpedition = getCodeExpedition(event.getClcdex());
		String etatCivil = getEtatCivil(event.getCletcv());
		String dateOuverture = utilService.changeDateFormatFdblop(event.getCldtou());
		String dateDerniereModification = changeDateFormat(event.getCldtmu(), "ddMMyy");
		String typeGestion = getTypeGestion(event.getClgest());

		event.setEventType(eventType);
		event.setAdresseClient(addressClient);
		event.setTypeClient(clientType);
		event.setCodeExpedition(codeExpedition);
		event.setEtatCivil(etatCivil);
		event.setDateOuverture(dateOuverture);
		event.setTypeGestion(typeGestion);
		event.setDateDerniereModification(dateDerniereModification);
		return event;
	}

	private String getTypeGestion(String clgest) {
		return FdbCliTypeGesion.getByCode(clgest).name();
	}

	private String getEtatCivil(String cletat) {
		return FdbCliEtatCivil.getByCode(cletat).name();
	}

	private String getCodeExpedition(String clcdex) {
		return FdbCliCodeExpedition.getByCode(clcdex).name();
	}

	private String getAdresseClient(FDBCLI event) {
		return Utils.removeExcessiveWhitespaces(event.getClad02()) + " "
				+ Utils.removeExcessiveWhitespaces(event.getClad03()) + " "
				+ Utils.removeExcessiveWhitespaces(event.getClad04()) + " "
				+ Utils.removeExcessiveWhitespaces(event.getClad05()) + " "
				+ Utils.removeExcessiveWhitespaces(event.getClad06());
	}

	private String getTypeClient(String code) {
		FdbCliType fdbCliType = FdbCliType.getByCode(code);
		return fdbCliType.name();
	}
}
