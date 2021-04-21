package ma.cdgk.infra.eventenricher;

import static ma.cdgk.infra.eventenricher.Utils.changeDateFormat;

import java.util.Optional;
import lombok.AllArgsConstructor;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.domain.events.oly.FDBLOP;
import ma.cdgk.events.oly.FdbCliType;
import ma.cdgk.events.oly.OperationStatut;
import ma.cdgk.events.oly.OperationType;
import ma.cdgk.infra.eventtype.EventTypeProviderImpl;
import ma.cdgk.infra.providers.FdbcliProvider;
import ma.cdgk.infra.providers.FdbnumProvider;
import ma.cdgk.infra.providers.FdbtabProvider;
import ma.cdgk.producer.starter.domain.eventHistory.EventEnricher;
import ma.cdgk.producer.starter.domain.utils.UtilService;
import ma.cdgk.producer.starter.domain.utils.Utils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Service
public class FdbLopEventEnricher implements EventEnricher<FDBLOP> {
	private final UtilService utilService;
	private final FdbcliProvider fdbcliProvider;
	private final FdbnumProvider fdbnumProvider;
	private final FdbtabProvider fdbtabProvider;

	@Override
	public FDBLOP enrich(FDBLOP event) {

		String eventType = utilService.getEventType(EventTypeProviderImpl.fdbLopAddOrUpdateEvent);
		String referenceOperation = getRefernce(event);

		String numeroCompteDebit = getNumeroCompteDebit(event);
		String numeroCompteCredit = getNumeroCompteCredit(event);
		String typeOperationLibelelle = getTypeOperationLibelle(event);
		String ribDebit = getRibDedit(event);
		String ribCredit = getRibCredit(event);
		String statutOperation = getStatutOperation(event);
		String typeOperation = getTypeOperation(event);
		String dateValeurDebit = utilService.changeDateFormatFdblop(event.getOpddav());
		String dateValeurCredit = utilService.changeDateFormatFdblop(event.getOpcdav());
		String deviseDebit = Optional.ofNullable(event.getOpdbao()).orElse("");
		String deviseCredit = Optional.ofNullable(event.getOpcbao()).orElse("");
		String libelle = getLibelle(event);
		String dateOperation = getDateOperation(event);
		String typeClientDebit = getTypeClientDebit(event);
		String typeClientCredit = getTypeClientCredit(event);
		String nomClientCredit = getNomClientCredit(event);
		String nomClientDebit = getNomClientDebit(event);
		String adressClientDebit = getAdressClientDebit(event);
		String adressClientCredit = getAdressClientCredit(event);
		String idSourceOperation = getIdSourceOperation(event);

		event.setAdresseClientDebit(adressClientDebit);
		event.setNomClientDebit(nomClientCredit);
		event.setTypeClientDebit(typeClientDebit);
		event.setCodeTypeClientDebit(getCodeTypeClientDebit(event));
		event.setNumeroCompteDebit(numeroCompteDebit);
		event.setRibDebit(ribDebit);
		event.setDeviseDebit(deviseDebit);
		event.setDateValeurDebit(dateValeurDebit);

		event.setAdresseClientCredit(adressClientCredit);
		event.setNomClientCredit(nomClientDebit);
		event.setTypeClientCredit(typeClientCredit);
		event.setCodeTypeClientCredit(getCodeTypeClientCredit(event));
		event.setRibCredit(ribCredit);
		event.setNumeroCompteCredit(numeroCompteCredit);
		event.setDeviseCredit(deviseCredit);
		event.setDateValeurCredit(dateValeurCredit);

		event.setDateOperation(dateOperation);
		event.setTypeOperation(typeOperation);
		event.setStatutOperation(statutOperation);
		event.setEventType(eventType);
		event.setReferenceOperation(referenceOperation);
		event.setTypeOperationLibelle(typeOperationLibelelle);
		event.setLibelle(libelle);
		event.setIdSourceOperation(idSourceOperation);

		return event;
	}

	private String getRefernce(FDBLOP event) {
		String idOperation = Optional.ofNullable(event.getOpid()).map(String::valueOf).orElse("");
		String opNope = Optional.ofNullable(event.getOpnope()).map(String::valueOf).orElse("");
		return idOperation + "-" + opNope;
	}

	public String getIdSourceOperation(FDBLOP event) {
		return "" + event.getLplpro() + event.getLplid() + event.getLplref() + event.getLplseq();
	}

	public String getNumeroCompteDebit(FDBLOP fdblop) {

		return fdblop.getOpdbrc() + fdblop.getOpdbgr() + fdblop.getOpdbru() + fdblop.getOpdbnm();
	}

	public String getNumeroCompteCredit(FDBLOP fdblop) {

		return fdblop.getOpcrrc() + fdblop.getOpcrgr() + fdblop.getOpcrru() + fdblop.getOpcrnm();
	}

	public String getTypeOperationLibelle(FDBLOP fdblop) {
		Optional<Fdbtab> fdbtab = fdbtabProvider.getFdbtabByTbidAndTbcode("049", fdblop.getOpid());
		return fdbtab.map(f -> Utils.removeExcessiveWhitespaces(fdbtab.get().getTbdes1())).orElse("");
	}

	public String getRibCredit(FDBLOP fdblop) {
		Optional<Fdbnum> fdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(fdblop.getOpcrrc(),
				fdblop.getOpcrgr(), fdblop.getOpcrru(), fdblop.getOpcrnm(), "217");
		String rib = null;
		if (fdbnum.isPresent()) {
			rib = fdbnum.get().getNurefe();
		}
		return rib;
	}

	public String getRibDedit(FDBLOP fdblop) {

		Optional<Fdbnum> fdbnum = fdbnumProvider.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype(fdblop.getOpdbrc(),
				fdblop.getOpdbgr(), fdblop.getOpdbru(), fdblop.getOpdbnm(), "217");
		String rib = null;
		if (fdbnum.isPresent()) {
			rib = StringUtils.trimAllWhitespace(fdbnum.get().getNurefe());
		}
		return rib;
	}

	public String getStatutOperation(FDBLOP fdblop) {
		OperationStatut operationStatut = OperationStatut.getByCode(fdblop.getLpstat());
		return operationStatut == OperationStatut.NOTFOUND ? null : operationStatut.name();
	}

	public String getTypeOperation(FDBLOP fdblop) {
		String typeOperation;
		String opid = Optional.ofNullable(fdblop.getOpid()).orElse("");
		typeOperation = OperationType.getByCode(opid).name();

		return typeOperation;
	}

	public String getLibelle(FDBLOP fdblop) {

		return Utils.removeExcessiveWhitespaces(Optional.ofNullable(fdblop.getOpbia1()).orElse("") + " "
				+ Optional.ofNullable(fdblop.getOpbia2()).orElse("") + " "
				+ Optional.ofNullable(fdblop.getOpbia3()).orElse("") + " "
				+ Optional.ofNullable(fdblop.getOpbia4()).orElse(""));
	}

	public String getDateOperation(FDBLOP fdblop) {
		String dateOperation = Optional.ofNullable(fdblop.getLpdtjj()).orElse("00")
				+ Optional.ofNullable(fdblop.getLpdtmm()).orElse("00")
				+ Optional.ofNullable(fdblop.getLpdtaa()).orElse("00");
		return changeDateFormat(dateOperation, "ddMMyyyy");
	}

	private String getTypeClientDebit(FDBLOP fdblop) {
		String codeClient = Optional.ofNullable(fdblop.getOpdbrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(codeClient);

		return fdbcli.map(c -> {
			FdbCliType fdbCliType = FdbCliType.getByCode(c.getCltype());
			return fdbCliType.name();
		}).orElse(FdbCliType.NOTFOUND.name());
	}

	private String getCodeTypeClientDebit(FDBLOP fdblop) {
		String codeClient = Optional.ofNullable(fdblop.getOpdbrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(codeClient);

		return fdbcli.map(Fdbcli::getCltype).orElse(null);
	}

	public String getTypeClientCredit(FDBLOP fdblop) {
		String codeClient = Optional.ofNullable(fdblop.getOpcrrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(codeClient);

		return fdbcli.map(c -> {
			FdbCliType fdbCliType = FdbCliType.getByCode(c.getCltype());
			return fdbCliType.name();
		}).orElse(FdbCliType.NOTFOUND.name());
	}

	private String getCodeTypeClientCredit(FDBLOP fdblop) {
		String codeClient = Optional.ofNullable(fdblop.getOpcrrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(codeClient);

		return fdbcli.map(Fdbcli::getCltype).orElse(null);
	}

	public String getNomClientCredit(FDBLOP fdblop) {
		String code = Optional.ofNullable(fdblop.getOpcrrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(code);
		return fdbcli.map(f -> StringUtils.trimWhitespace(fdbcli.get().getClnomc())).orElse("");
	}

	public String getNomClientDebit(FDBLOP fdblop) {
		String code = Optional.ofNullable(fdblop.getOpdbrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(code);

		return fdbcli.map(f -> StringUtils.trimWhitespace(fdbcli.get().getClnomc())).orElse("");
	}

	public String getAdressClientDebit(FDBLOP fdblop) {
		String code = Optional.ofNullable(fdblop.getOpdbrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(code);
		Fdbcli fdbcliValue = fdbcli.orElse(new Fdbcli());
		return fdbcli
				.map(f -> Utils.removeExcessiveWhitespaces(fdbcliValue.getClad02() + " " + fdbcliValue.getClad03() + " "
						+ fdbcliValue.getClad04() + " " + fdbcliValue.getClad05() + " " + fdbcliValue.getClad06()))
				.orElse("");
	}

	public String getAdressClientCredit(FDBLOP fdblop) {
		String code = Optional.ofNullable(fdblop.getOpcrrc()).orElse("");
		Optional<Fdbcli> fdbcli = fdbcliProvider.getClientByClraci(code);
		Fdbcli fdbcliValue = fdbcli.orElse(new Fdbcli());
		return fdbcli.map(f -> Utils.removeExcessiveWhitespaces((fdbcliValue.getClad02() + " " + fdbcliValue.getClad03()
				+ " " + fdbcliValue.getClad04() + " " + fdbcliValue.getClad05() + " " + fdbcliValue.getClad06())))
				.orElse("");
	}
}
