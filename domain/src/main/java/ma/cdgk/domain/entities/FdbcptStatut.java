package ma.cdgk.domain.entities;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Getter
public enum FdbcptStatut {
	ACTIF("ACTIF", Arrays.asList("", "M", "P")), CLOTURE("CLOTURE", Collections.singletonList("A")), BLOQUE("BLOQUE",
			Collections.singletonList("B")),;

	private final String name;
	private final List<String> codes;

	public static FdbcptStatut getByCode(String code) {
		return Arrays.stream(FdbcptStatut.values())
				.filter(v -> v.getCodes().contains(StringUtils.trimAllWhitespace(code))).findFirst().orElseThrow();
	}
}
