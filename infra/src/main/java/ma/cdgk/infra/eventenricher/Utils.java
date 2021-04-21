package ma.cdgk.infra.eventenricher;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class Utils {

	public static final String DATE_DEFAULT_FORMAT = "dd-MM-yyyy";

	public static String changeDateFormat(String date, String sourceFormat) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(sourceFormat);
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern(DATE_DEFAULT_FORMAT);
		try {
			LocalDate parsedDate = LocalDate.parse(date, formatter);
			return parsedDate.format(formatter2);
		} catch (DateTimeParseException e) {
			return formatter2.format(LocalDate.now());
		}
	}

}
