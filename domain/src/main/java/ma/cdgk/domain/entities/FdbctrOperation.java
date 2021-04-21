package ma.cdgk.domain.entities;

import java.util.Arrays;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum FdbctrOperation {
	NOUVEAU_CONTRAT("N", "nouveau contrat"), PROROAGATION("P", "prorogation"), LIQUIDATION("L",
			"liquidation"), PAIEMENT_DES_INTERETS("I",
					"paiement des intérêts"), NOUVELLE_ECHEANCE("E", "nouvelle échéance");

	private final String code;
	private final String operation;

	public static FdbctrOperation getByCode(String code) {
		return Arrays.stream(FdbctrOperation.values()).filter(fdbctrOperation -> fdbctrOperation.getCode().equals(code))
				.findFirst().orElseThrow();
	}
}
