package ma.cdgk.domain.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "FDBCLI")
public class Fdbcli implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String clraci;
	private String cletat;
	private String cldtou;
	private String cldtmu;
	private String cldtan;
	private Integer clnbrm;
	private String cloprn;
	private String clgrpe;
	private String clagnt;
	private String clcent;
	private String clgera;
	private String cletcv;
	private String clnom;
	private String clprnm;
	private String clorig;
	private String cltype;
	private String clnomc;
	private String cldtna;
	private String cldtdc;
	private String clsrcd;
	private Integer cllnge;
	private String clcdex;
	private String cldesi;
	private String clad01;
	private String clad02;
	private String clad03;
	private String clad04;
	private String clad05;
	private String clad06;
	private String cldomi;
	private String clregi;
	private String clacti;
	private String clsect;
	private String clnati;
	private String clnacp;
	private String clrpg;
}
