package ma.cdgk.infra.eventenricher;

import static ma.cdgk.infra.eventenricher.Utils.changeDateFormat;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBCTR;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import ma.cdgk.producer.starter.domain.utils.Utils;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbCtrEventEnricher implements EventEnricher<FDBCTR> {

	public static final String DATE_FORMAT = "dd-MM-yyyy";
	private final FdbtabProvider fdbtabProvider;
	private final UtilService utilService;

	@Override
	public FDBCTR enrich(FDBCTR event) {
		event.setEventType(utilService.getEventType(EventTypeProviderImpl.fdbCtrAddOrUpdateEvent));
		event.setIdContrat(getIdContrat(event));
		event.setIdClient(event.getCtraci());
		event.setNumeroCompte(getNumeroCompte(event));

		String dateOuverture = changeDateFormat(event.getCtdtou(), "ddMMyy");
		event.setDateOuverture(dateOuverture);
		String dateEcheance = changeDateFormat(event.getCtechj() + event.getCtechm() + event.getCtecha(), "ddMMyyyy");
		event.setDateEcheance(dateEcheance);
		event.setDureeCredit(String.valueOf(ChronoUnit.MONTHS.between(
				LocalDate.parse(dateEcheance, DateTimeFormatter.ofPattern(DATE_FORMAT)).withDayOfMonth(1),
				LocalDate.parse(dateOuverture, DateTimeFormatter.ofPattern(DATE_FORMAT)).withDayOfMonth(1))));
		event.setDateDernierPaiementDesInterets(
				changeDateFormat(event.getCtdjin() + event.getCtdmin() + event.getCtdain(), "ddMMyyyy"));

		event.setTypeTaux(getTypeTaux(event));
		event.setTauxInteret(event.getCttaux());
		event.setInterets(String.valueOf(event.getCtintt()));
		event.setInteretsCourus(String.valueOf(getInteretsCourus()));

		event.setEncours(getEncours(event));
		event.setCompteG(null);
		event.setDevise(getDevise(event.getCtmon()));
		event.setNatureArc(String.valueOf(getNatureArc(event)));
		event.setLibelleProduit(getLibelleProduit(event.getCtmon()));
		return event;
	}

	private Character getNatureArc(FDBCTR event) {
		Character natureArc = null;
		if (List.of("859", "861", "866", "896").contains(event.getCtid())) {
			natureArc = 'G';
		} else if (List.of("864", "863", "867", "868", "846", "869").contains(event.getCtid())) {
			natureArc = 'S';
		}
		return natureArc;
	}

	private String getEncours(FDBCTR event) {
		return String.valueOf(event.getCtcapi());
	}

	private Double getInteretsCourus() {

		return null;
	}

	private String getTypeTaux(FDBCTR event) {
		return event.getCttpla().equals("00000000") ? "F" : "V";
	}

	private String getIdContrat(FDBCTR event) {
		return event.getCtid() + "-" + event.getCtcont();
	}

	private String getNumeroCompte(FDBCTR fdbctr) {
		return fdbctr.getCtraci() + fdbctr.getCtgre() + fdbctr.getCtrub() + fdbctr.getCtmon();
	}

	private String getDevise(String ctmon) {
		String devise = null;
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("040", ctmon);
		if (fdbtab.isPresent()) {
			devise = fdbtab.get().getTbcomp().substring(0, 3);
		}
		return devise;
	}

	private String getLibelleProduit(String ctid) {
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("052", ctid);
		return fdbtab.map(f -> Utils.removeExcessiveWhitespaces(fdbtab.get().getTbdes1())).orElse("");
	}
}
