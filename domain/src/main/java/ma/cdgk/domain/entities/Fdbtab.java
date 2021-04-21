package ma.cdgk.domain.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "FDBTAB")
@IdClass(Fdbtab.class)
public class Fdbtab implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "TBID")
	private String tbid;

	@Id
	@Column(name = "TBCODE")
	private String tbcode;

	@Column(name = "TBNBRM")
	private Integer tbnbrm;

	@Column(name = "TBETAT")
	private String tbetat;

	@Column(name = "TBDTOU")
	private String tbdtou;

	@Column(name = "TBDTMU")
	private String tbdtmu;

	@Column(name = "TBOPRN")
	private String tboprn;

	@Column(name = "TBDES1")
	private String tbdes1;

	@Column(name = "TBDES2")
	private String tbdes2;

	@Column(name = "TBDES3")
	private String tbdes3;

	@Column(name = "TBDES4")
	private String tbdes4;

	@Column(name = "TBCOMP")
	private String tbcomp;

	@Column(name = "TBCOMP2")
	private String tbcomp2;
}
