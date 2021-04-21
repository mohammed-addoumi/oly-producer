package ma.cdgk.infra.eventenricher;

import static org.springframework.util.StringUtils.trimWhitespace;

import java.util.Optional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.FdbcptStatut;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBCPT;
import ma.cdgk.events.oly.FdbCliType;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import ma.cdgk.producer.starter.domain.utils.Utils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Service
@Slf4j
public class FdbCptEventEnricher implements EventEnricher<FDBCPT> {

	private final FdbcliProvider fdbcliProvider;
	private final FdbnumProvider fdbnumProvider;
	private final FdbtabProvider fdbtabProvider;

	private final UtilService utilService;

	@Override
	public FDBCPT enrich(FDBCPT event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbCptAddOrUpdateEvent);
		Optional<Fdbtab> fdbtabAgence = getAgence(String.valueOf(event.getCpcent()));
		String codeAgence = fdbtabAgence.map(this::parseCodeAgence).orElse(Strings.EMPTY);
		String nomAgence = fdbtabAgence.map(this::parseNomAgence).orElse(Strings.EMPTY);
		String codeDevise = getDevise(event.getCpmon());
		String rib = getRib(event);
		String numeroCompte = parseNumeroCompte(event);
		String iban = getIban(event);
		String statut = getStatut(event);
		Optional<Fdbcli> fdbClient = fdbcliProvider.getClientByClraci(event.getCpraci());
		String dateDernierMouvement = utilService.changeDateFormat(event.getCpdtdm());
		String dateValeurDernierMouvement = utilService.changeDateFormat(event.getCpdtdb());

		fdbClient.ifPresent(cli -> {
			event.setAdresseClient(getAdresseClient(cli));
			event.setVille(getVille(cli.getClregi()));
			event.setPays(getPays(cli.getCldomi()));
			event.setNationalite(getNationalite(cli.getClnati()));
			event.setTypeClient(getTypeClient(cli.getCltype()));
			event.setCodeTypeClient(cli.getCltype());
			event.setIntitule(getIntitule(event));
			event.setNom(getNom(cli));
			event.setPrenom(getPrenom(cli));
			String pcec = getPcecByTbcode(event.getCpgre() + event.getCpnatu() + cli.getClnacp());
			event.setPcec(
					ObjectUtils.isEmpty(pcec) ? getPcecByTbcode(event.getCpgre() + event.getCpnatu() + "000") : pcec);
		});

		event.setEventType(eventType);
		event.setDevise(codeDevise);
		event.setNumeroCompte(numeroCompte);
		event.setCodeAgence(codeAgence);
		event.setNomAgence(nomAgence);
		event.setRib(rib);
		event.setIban(iban);
		event.setStatut(statut);
		event.setDateDernierMouvement(dateDernierMouvement);
		event.setDateValeurDernierMouvement(dateValeurDernierMouvement);
		return event;
	}
	private String getPcecByTbcode(String tbcode) {
		String pcec = null;
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcodeAndTbetatIsBlank("035", tbcode);
		if (fdbtab.isPresent()) {
			pcec = fdbtab.get().getTbcomp().substring(9, 16);
		}
		return pcec;
	}

	private String getIntitule(FDBCPT event) {
		return trimWhitespace(event.getCptrub());
	}

	private String getNom(Fdbcli cli) {
		String nom = Optional.ofNullable(cli.getClnom()).map(StringUtils::trimWhitespace).orElse(Strings.EMPTY);
		return trimWhitespace(nom);
	}

	private String getPrenom(Fdbcli cli) {
		String prenom = Optional.ofNullable(cli.getClprnm()).map(StringUtils::trimWhitespace).orElse(Strings.EMPTY);
		return trimWhitespace(prenom);
	}

	private Optional<Fdbtab> getAgence(String cpcent) {
		return fdbtabProvider.getFdbtabByTbidAndTbcode("905", cpcent);
	}

	private String parseCodeAgence(Fdbtab fdbTab) {
		return trimWhitespace(fdbTab.getTbcode());
	}

	private String parseNomAgence(Fdbtab fdbTab) {
		String tbdes = fdbTab.getTbdes3().substring(29) + fdbTab.getTbdes4().substring(0, 20);
		return tbdes.trim();
	}

	private String getDevise(String cpmon) {
		String devise = null;
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("040", cpmon);
		if (fdbtab.isPresent()) {
			devise = fdbtab.get().getTbcomp().substring(0, 3);
		}
		return devise;
	}

	private String getRib(FDBCPT fdbcpt) {

		Optional<Fdbnum> fdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(fdbcpt.getCpraci(),
				fdbcpt.getCpgre(), fdbcpt.getCprub(), fdbcpt.getCpmon(), "217");
		String rib = null;
		if (fdbnum.isPresent()) {

			rib = trimWhitespace(fdbnum.get().getNurefe());
		}
		return rib;
	}

	private String getIban(FDBCPT fdbcpt) {
		return fdbnumProvider
				.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(fdbcpt.getCpraci(), fdbcpt.getCpgre(),
						fdbcpt.getCprub(), fdbcpt.getCpmon(), "099")
				.map(fdbnum -> trimWhitespace(fdbnum.getNurefe())).orElse("");
	}

	private String parseNumeroCompte(FDBCPT fdbcpt) {
		return fdbcpt.getCpraci() + fdbcpt.getCpgre() + fdbcpt.getCprub() + fdbcpt.getCpmon();
	}

	private String getAdresseClient(Fdbcli fdbcli) {
		return trimWhitespace(Utils.removeExcessiveWhitespaces(fdbcli.getClad02()) + " "
				+ Utils.removeExcessiveWhitespaces(fdbcli.getClad03()) + " "
				+ Utils.removeExcessiveWhitespaces(fdbcli.getClad04()) + " "
				+ Utils.removeExcessiveWhitespaces(fdbcli.getClad05()) + " "
				+ Utils.removeExcessiveWhitespaces(fdbcli.getClad06()) + " ");
	}

	private String getVille(String clregi) {

		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("021", clregi);
		return fdbtab.map(t -> trimWhitespace(t.getTbdes1())).orElse("");
	}

	private String getPays(String cldomi) {

		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("020", cldomi);
		return fdbtab.map(t -> trimWhitespace(t.getTbdes1())).orElse("");
	}

	private String getNationalite(String clnati) {

		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("020", clnati);
		return fdbtab.map(t -> trimWhitespace(t.getTbdes1())).orElse("");
	}

	private String getStatut(FDBCPT fdbcpt) {
		FdbcptStatut fdbcptStatut = FdbcptStatut.getByCode(fdbcpt.getCpetat());
		return fdbcptStatut.getName();
	}

	private String getTypeClient(String code) {
		FdbCliType fdbCliType = FdbCliType.getByCode(code);
		return fdbCliType.name();
	}
}
