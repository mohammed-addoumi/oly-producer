package ma.cdgk.infra.eventenricher;
import static ma.cdgk.infra.eventenricher.Utils.changeDateFormat;

import java.util.Optional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBAFL;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbAflEventEnricher implements EventEnricher<FDBAFL> {

	private final UtilService utilService;
	private final FdbtabProvider fdbtabProvider;

	@Override
	public FDBAFL enrich(FDBAFL event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbAflAddOrUpdateEvent);
		String racineClient = getRacineClient(event);
		String monnaieCompte = getMonnaieCompte(event);
		String rubriqueCompte = getRubriqueCompte(event);
		String referenceLog = getReferenceLog(event);
		String numeroCompte = getNumeroCompte(event);
		String dateDernierMouvement = getDateDernierMouvement(event);
		String devise = getDevise(monnaieCompte);

		event.setEventType(eventType);
		event.setNumeroCompte(numeroCompte);
		event.setMonnaieCompte(monnaieCompte);
		event.setRubriqueCompte(rubriqueCompte);
		event.setReferenceLog(referenceLog);
		event.setRacineClient(racineClient);
		event.setDateDernierMouvement(dateDernierMouvement);
		event.setDevise(devise);

		return event;
	}

	private String getNumeroCompte(FDBAFL event) {
		return getRacineClient(event) + getGenreCompte(event) + getRubriqueCompte(event) + getMonnaieCompte(event);
	}

	private String getRubriqueCompte(FDBAFL event) {
		return Optional.ofNullable(event.getAfrefa().substring(10, 13)).orElse("");
	}

	private String getGenreCompte(FDBAFL event) {

		return Optional.ofNullable(event.getAfrefa().substring(7, 10)).orElse("");
	}

	private String getMonnaieCompte(FDBAFL event) {

		return Optional.ofNullable(event.getAfrefa().substring(13, 16)).orElse("");
	}

	private String getRacineClient(FDBAFL event) {
		return Optional.ofNullable(event.getAfrefa().substring(0, 7)).orElse("");
	}

	private String getReferenceLog(FDBAFL event) {
		return Optional.ofNullable(event.getAfrefa().substring(10, 16)).orElse("");
	}

	private String getDevise(String cpmon) {
		String devise = null;
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("040", cpmon);
		if (fdbtab.isPresent()) {
			devise = fdbtab.get().getTbcomp().substring(0, 3);
		}
		return devise;
	}

	public String getDateDernierMouvement(FDBAFL fdbafl) {
		String dateDernierMouvement = Optional.ofNullable(fdbafl.getAfdtsy()).orElse("000000");
		return changeDateFormat(dateDernierMouvement, "ddMMyy");
	}
}
