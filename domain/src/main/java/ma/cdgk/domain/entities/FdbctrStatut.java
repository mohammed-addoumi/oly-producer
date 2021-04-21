package ma.cdgk.domain.entities;

import java.util.Arrays;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum FdbctrStatut {
	CONTRAT_EN_ATTENTE("0", "contrat en attente"), CONTRAT_CONTROLE("1", "contrat contrôlé"), CONTRAT_EN_ACTIVITE("2",
			"contrat en activité"), CONTRAT_EXECUTE("3", "contrat exécuté"), CONTRAT_ECHU("4",
					"contrat échu"), CONTRAT_LIBERE("5", "contrat libéré"), CONTRAT_ANNULE("9", "contrat annulé");

	private final String code;
	private final String status;

	public static FdbctrStatut getByCode(String code) {
		return Arrays.stream(FdbctrStatut.values()).filter(fdbctrStatut -> fdbctrStatut.getCode().equals(code))
				.findFirst().orElseThrow();
	}
}
