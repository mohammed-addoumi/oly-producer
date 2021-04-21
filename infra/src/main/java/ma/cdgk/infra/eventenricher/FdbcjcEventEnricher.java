package ma.cdgk.infra.eventenricher;

import java.util.Optional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.cdgcapital.avro.oly.FDBCJC;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.Fdblop;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdblopProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Slf4j
public class FdbcjcEventEnricher implements EventEnricher<FDBCJC> {

	private final UtilService utilService;
	private final FdbnumProvider fdbnumProvider;
	private final FdblopProvider fdblopProvider;
	private final FdbcliProvider fdbcliProvider;
	private final FdbtabProvider fdbtabProvider;

	@Override
	public FDBCJC enrich(FDBCJC event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.FdbcjcAddOrUpdateEvent);
		event.setEventType(eventType);

		Optional<Fdblop> optionalOperation = fdblopProvider.getOperationByByOpidAndOpnope(event.getCjccope(),
				event.getCjcnope());

		optionalOperation.ifPresentOrElse(operation -> {
			log.debug(String.format("Operation with OPID %s and OPNOPE %s found on fdblop", event.getCjccope(),
					event.getCjcnope()));
			event.setDateValeur(utilService.changeDateFormatFdblop(operation.getOpddav()));
			event.setCodeAgence(operation.getOpagce());
			event.setRibClient(getRibDebit(operation));
			event.setRibCompteCredit(getRibCredit(operation));
			event.setRefLettrage(operation.getOpvref());
			event.setDevise(operation.getOpdbao());
			event.setDateEcheanceContrat(utilService.changeDateFormatFdblop(operation.getOpeche()));

			event.setCodeCaisse(operation.getOpdbru());
			event.setTauxDeChange(operation.getOpdcrs());
			event.setTauxDeChangeCr(operation.getOpccrs());
			event.setDateTauxDeChange(operation.getOpddav());
			event.setDateTauxDeChangeCr(operation.getOpcdav());

			event.setReferenceCommission(String.valueOf(operation.getLplref()));

			event.setTiers2(getCodeClientDebit(operation));
			event.setTiers2Cr(getCodeClientCredit(operation));
			event.setSegmentClient(getCodeClientDebit(operation));
			event.setSegmentClientCr(getCodeClientCredit(operation));

			event.setSegmentMetier(getSegmentMetier(operation));
			event.setSegmentProduit(getSegmentProduit(operation, event.getSegmentMetier()));

		}, () -> log.debug(String.format("Operation with OPID %s and OPNOPE %s not found on fdblop", event.getCjccope(),
				event.getCjcnope())));

		return event;
	}

	public String getRibDebit(Fdblop fdblop) {
		Optional<Fdbnum> optionalFdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(
				fdblop.getOpdbrc(), fdblop.getOpdbgr(), fdblop.getOpdbru(), fdblop.getOpdbnm(), "217");
		return optionalFdbnum.map(Fdbnum::getNurefe).map(String::trim).orElse("");
	}

	public String getRibCredit(Fdblop fdblop) {
		Optional<Fdbnum> optionalFdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(
				fdblop.getOpcrrc(), fdblop.getOpcrgr(), fdblop.getOpcrru(), fdblop.getOpcrnm(), "217");
		return optionalFdbnum.map(Fdbnum::getNurefe).map(String::trim).orElse("");

	}

	public String getCodeClientDebit(Fdblop fdblop) {
		Optional<Fdbnum> optionalFdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(
				fdblop.getOpdbrc(), fdblop.getOpdbgr(), fdblop.getOpdbru(), fdblop.getOpdbnm(), "300");
		return optionalFdbnum.map(Fdbnum::getNurefe).map(String::trim).orElse("");
	}

	public String getCodeClientCredit(Fdblop fdblop) {
		Optional<Fdbnum> optionalFdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(
				fdblop.getOpcrrc(), fdblop.getOpcrgr(), fdblop.getOpcrru(), fdblop.getOpcrnm(), "300");
		return optionalFdbnum.map(Fdbnum::getNurefe).map(String::trim).orElse("");
	}

	public String getSegmentMetier(Fdblop fdblop) {
		Optional<Fdbcli> optionalFdbcli = fdbcliProvider.getClientByClraciAndCltype(fdblop.getOpdbrc(), "P");
		if (optionalFdbcli.isPresent()) {
			String clrpg = optionalFdbcli.get().getClrpg();
			Optional<Fdbtab> optionalFdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("901",
					"ORACLEMV2MET".concat(clrpg));
			if (optionalFdbtab.isPresent())
				return optionalFdbtab.get().getTbdes1();
		}
		return "";
	}

	public String getSegmentProduit(Fdblop fdblop, String metier) {
		Optional<Fdbtab> optionalFdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("901",
				"ORACLEMV2PRO".concat(fdblop.getOpid()).concat(metier));
		if (optionalFdbtab.isPresent())
			return optionalFdbtab.get().getTbdes1();
		return "";
	}

}
