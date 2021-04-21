package ma.cdgk.infra.eventenricher;

import static ma.cdgk.domain.util.Utils.transformDateOrDefault;

import java.util.Optional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.Fdblop;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBMVT;
import ma.cdgk.events.oly.FdbCliType;
import ma.cdgk.events.oly.OperationType;
import ma.cdgk.events.utils.StringUtils;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdblopProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import ma.cdgk.producer.starter.domain.utils.Utils;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbMvtEventEnricher implements EventEnricher<FDBMVT> {

	private final FdbtabProvider fdbtabProvider;
	private final FdbnumProvider fdbnumProvider;
	private final FdbcliProvider fdbcliProvider;
	private final UtilService utilService;
	private final FdblopProvider fdblopProvider;

	@Override
	public FDBMVT enrich(FDBMVT event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbMvtAddOrUpdateEvent);

		String numeroCompte = getNumeroCompte(event);
		String statut = getStatut(event);
		String devise = getDevise(event.getMvmon());
		String dateMouvement = transformDateOrDefault(String.valueOf(event.getMvdtop()));
		String dateValeur = transformDateOrDefault(String.valueOf(event.getMvdtva()));
		String dateReference = transformDateOrDefault(String.valueOf(event.getMvdtrf()));
		String dateSystem = transformDateOrDefault(String.valueOf(event.getMvdtsy()));
		String idSource = getIdSource(event);
		String rib = getRib(event);
		String libelle = getLibelle(event);
		String refernce = getReference(event);
		String typeClient = getTypeClient(event);
		String nomClient = getNomClient(event);
		String typeMouvement = getTypeMouvement(event);
		String typeMouvementLibelle = getTypeMouvementLibelle(event);
		Optional<Fdblop> optionalFdblop = getOperation(event);

		event.setEventType(eventType);
		event.setNumeroCompte(numeroCompte);
		event.setStatut(statut);
		event.setDevise(devise);
		event.setDateMouvement(dateMouvement);
		event.setDateValeur(dateValeur);
		event.setDateReference(dateReference);
		event.setDateSystem(dateSystem);
		event.setIdSource(idSource);
		event.setReferenceMouvement(refernce);
		event.setTypeClient(typeClient);
		event.setCodeTypeClient(getCodeTypeClientCredit(event));
		event.setRib(rib);
		event.setNomClient(nomClient);
		event.setTypeMouvement(typeMouvement);
		event.setTypeMouvementLibelle(typeMouvementLibelle);
		event.setLibelle(libelle);

		if (optionalFdblop.isPresent()) {
			Fdblop fdblop = optionalFdblop.get();
			event.setOpbco1(fdblop.getOpbco1());
			event.setOpbco2(fdblop.getOpbco2());
			event.setOpbco3(fdblop.getOpbco3());
			event.setOpbco4(fdblop.getOpbco4());
			event.setOpbco5(fdblop.getOpbco5());
			event.setOpdoa1(fdblop.getOpdoa1());
			event.setOpdoa2(fdblop.getOpdoa2());
			event.setOpdoa3(fdblop.getOpdoa3());
			event.setOpdoa4(fdblop.getOpdoa4());
		}

		return event;
	}

	private Optional<Fdblop> getOperation(FDBMVT event) {
		return fdblopProvider.getOperationByOpidAndLplref(String.valueOf(event.getMvidrs()), event.getMvnors());
	}

	private String getNumeroCompte(FDBMVT event) {
		return event.getMvraci() + event.getMvgre() + event.getMvrub() + event.getMvmon();
	}

	private String getStatut(FDBMVT event) {
		return event.getMvetat();
	}

	private String getDevise(String mvmon) {
		String devise = null;
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("040", mvmon);
		if (fdbtab.isPresent()) {
			devise = fdbtab.get().getTbcomp().substring(0, 3);
		}
		return devise;
	}

	private String getIdSource(FDBMVT event) {
		return event.getMvraci() + event.getMvgre() + event.getMvrub() + event.getMvmon() + event.getMvseqc();
	}

	private String getRib(FDBMVT event) {
		Optional<Fdbnum> fdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(event.getMvraci(),
				event.getMvgre(), event.getMvrub(), event.getMvmon(), "217");
		String rib = null;
		if (fdbnum.isPresent()) {
			rib = fdbnum.get().getNurefe();
		}
		return rib;
	}

	private String getLibelle(FDBMVT event) {
		return Utils.removeExcessiveWhitespaces(Optional.ofNullable(event.getMvlib1()).orElse(""));
	}

	private String getTypeClient(FDBMVT event) {
		String codeClient = Optional.ofNullable(event.getMvraci()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(codeClient);

		return fdbcli.map(c -> {
			FdbCliType fdbCliType = FdbCliType.getByCode(c.getCltype());
			return fdbCliType.name();
		}).orElse(FdbCliType.NOTFOUND.name());
	}

	private String getCodeTypeClientCredit(FDBMVT event) {
		String codeClient = Optional.ofNullable(event.getMvraci()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(codeClient);

		return fdbcli.map(Fdbcli::getCltype).orElse(null);
	}

	private String getReference(FDBMVT event) {
		String mvids = Optional.ofNullable(event.getMvidrs()).map(String::valueOf).orElse("");
		String mvnors = Optional.ofNullable(event.getMvnors()).map(String::valueOf).orElse("");
		return StringUtils.leftPad(mvids, 3, "0") + "-" + StringUtils.leftPad(mvnors, 11, "0");
	}

	private String getNomClient(FDBMVT event) {
		String code = Optional.ofNullable(event.getMvraci()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(code);
		return fdbcli.map(f -> StringUtils.trimWhitespace(fdbcli.get().getClnomc())).orElse("");
	}

	private String getTypeMouvement(FDBMVT event) {
		String mvid = Optional.ofNullable(event.getMvidrs()).map(String::valueOf).orElse("");
		return OperationType.getByCode(mvid).name();
	}

	public String getTypeMouvementLibelle(FDBMVT event) {

		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("049", String.valueOf(event.getMvidrs()));
		return fdbtab.map(f -> Utils.removeExcessiveWhitespaces(fdbtab.get().getTbdes1())).orElse("");
	}
}
