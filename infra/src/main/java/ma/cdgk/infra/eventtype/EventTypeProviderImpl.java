package ma.cdgk.infra.eventtype;

import lombok.extern.slf4j.Slf4j;
import ma.cdgcapital.avro.oly.FDBCJC;
import ma.cdgk.domain.events.oly.*;
import ma.cdgk.infra.eventenricher.*;
import ma.cdgk.infra.keyprovider.*;
import ma.cdgk.producer.starter.domain.eventType.EventType;
import ma.cdgk.producer.starter.domain.eventType.EventTypeProvider;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class EventTypeProviderImpl implements EventTypeProvider {

	public static final EventType fdbCptAddOrUpdateEvent = new EventType("FDBCPT_INSERT_OR_UPDATE", FDBCPT.class,
			FdbCptEventEnricher.class, FdbCptKeyProvider.class, "FDBCPT", "FDBCPT");

	public static final EventType fdbLopAddOrUpdateEvent = new EventType("FDBLOP_INSERT_OR_UPDATE", FDBLOP.class,
			FdbLopEventEnricher.class, FdbLopKeyProvider.class, "FDBLOP", "FDBLOP");

	public static final EventType fdbCliAddOrUpdateEvent = new EventType("FDBCLI_INSERT_OR_UPDATE", FDBCLI.class,
			FdbCliEventEnricher.class, FdbCliKeyProvider.class, "FDBCLI", "FDBCLI");
	public static final EventType fdbcltAddOrUpdateEvent = new EventType("FDBCLT_INSERT_OR_UPDATE", FDBCLT.class,
			FdbCltEventEnricher.class, FdbCltKeyProvider.class, "FDBCLT", "FDBCLT");
	public static final EventType fdbcpzAddOrUpdateEvent = new EventType("FDBCPZ_INSERT_OR_UPDATE", FDBCPZ.class,
			FdbCpzEventEnricher.class, FdbCpzKeyProvider.class, "FDBCPZ", "FDBCPZ");

	public static final EventType fdbMvtAddOrUpdateEvent = new EventType("FDBMVT_INSERT_OR_UPDATE", FDBMVT.class,
			FdbMvtEventEnricher.class, FdbMvtKeyProvider.class, "FDBMVT", "FDBMVT");
	public static final EventType fdbBsaAddOrUpdateEvent = new EventType("FDBBSA_INSERT_OR_UPDATE", FDBBSA.class,
			FdbBsaEventEnricher.class, FdbBsaKeyProvider.class, "FDBBSA", "FDBBSA");

	public static final EventType fdbCtrAddOrUpdateEvent = new EventType("FDBCTR_INSERT_OR_UPDATE", FDBCTR.class,
			FdbCtrEventEnricher.class, FdbCtrKeyProvider.class, "FDBCTR", "FDBCTR");
	public static final EventType fdbAflAddOrUpdateEvent = new EventType("FDBAFL_INSERT_OR_UPDATE", FDBAFL.class,
			FdbAflEventEnricher.class, FdbAflKeyProvider.class, "FDBAFL", "FDBAFL");

	public static final EventType FdbcjcAddOrUpdateEvent = new EventType("FDBCJC_INSERT_OR_UPDATE", FDBCJC.class,
			FdbcjcEventEnricher.class, FdbcjcKeyProvider.class, "FDBCJC", "FDBCJC");

	@Override
	public EventType getEventType(String eventType) {
		log.debug("Even Type {}", eventType);
		switch (eventType) {
			case "FDBCPT_INSERT_OR_UPDATE" :
				return fdbCptAddOrUpdateEvent;
			case "FDBLOP_INSERT_OR_UPDATE" :
				return fdbLopAddOrUpdateEvent;
			case "FDBCLI_INSERT_OR_UPDATE" :
				return fdbCliAddOrUpdateEvent;
			case "FDBMVT_INSERT_OR_UPDATE" :
				return fdbMvtAddOrUpdateEvent;
			case "FDBCTR_INSERT_OR_UPDATE" :
				return fdbCtrAddOrUpdateEvent;
			case "FDBCLT_INSERT_OR_UPDATE" :
				return fdbcltAddOrUpdateEvent;
			case "FDBCPZ_INSERT_OR_UPDATE" :
				return fdbcpzAddOrUpdateEvent;
			case "FDBBSA_INSERT_OR_UPDATE" :
				return fdbBsaAddOrUpdateEvent;
			case "FDBAFL_INSERT_OR_UPDATE" :
				return fdbAflAddOrUpdateEvent;
			case "FDBCJC_INSERT_OR_UPDATE" :
				return FdbcjcAddOrUpdateEvent;
			default :
				throw new IllegalArgumentException("Event Type Not Found on provider, try to add it correctly");
		}
	}
}
