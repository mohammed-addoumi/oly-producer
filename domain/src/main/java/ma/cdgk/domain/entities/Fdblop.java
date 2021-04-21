package ma.cdgk.domain.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.*;

@Setter
@Getter
@Entity
@Table(name = "FDBLOP")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Fdblop implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String opid;
	private String opnope;
	private String opbia1;
	private String opbia2;
	private String opbia3;
	private String opbia4;
	private String lpdtjj;
	private String lpdtmm;
	private String lpdtaa;
	private String opddav;
	private String opagce;
	private String opdbrc;
	private String opdbgr;
	private String opdbru;
	private String opdbnm;
	private String opvref;
	private String opdbao;
	private String opcrrc;
	private String opcrgr;
	private String opcrru;
	private String opcrnm;
	private String opdcpr;
	private String opeche;

	private String opdoa1;
	private String opdoa2;
	private String opdoa3;
	private String opdoa4;

	private String opbco1;
	private String opbco2;
	private String opbco3;
	private String opbco4;
	private String opbco5;

	private Long lplref;
	private String lpreserve;
	private String opcdav;
	private String opdcrs;
	private String opccrs;

}
