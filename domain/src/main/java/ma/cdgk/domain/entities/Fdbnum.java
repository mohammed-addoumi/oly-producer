package ma.cdgk.domain.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "FDBNUM")
@IdClass(Fdbnum.class)
public class Fdbnum implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "NUNIV")
	private String nuniv;

	@Id
	@Column(name = "NURACI")
	private String nuraci;

	@Id
	@Column(name = "NUGRE")
	private String nugre;

	@Id
	@Column(name = "NURUB")
	private String nurub;

	@Id
	@Column(name = "NUMON")
	private String numon;

	@Id
	@Column(name = "NUTYPE")
	private String nutype;

	@Column(name = "NUETAT")
	private String nuetat;

	@Column(name = "NUMFIL")
	private String numfil;

	@Column(name = "NUREFE")
	private String nurefe;
}
