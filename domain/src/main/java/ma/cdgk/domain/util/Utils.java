package ma.cdgk.domain.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Optional;

public class Utils {

	public static final String DATE_FORMAT = "dd-MM-yyyy";
	public static final String OLY_DEFAULT_DATE_FORMAT = "yyyyMMdd";

	public static final DateTimeFormatter OLY_DEFAULT_DATE_FORMATTER = DateTimeFormatter
			.ofPattern(OLY_DEFAULT_DATE_FORMAT);
	public static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern(DATE_FORMAT);

	private Utils() {
		throw new IllegalStateException("Utils class");
	}

	public static String transformDateOrDefault(String date) {
		try {
			return Optional.ofNullable(date)
					.map(d -> LocalDate.parse(date, OLY_DEFAULT_DATE_FORMATTER).format(DATE_FORMATTER)).orElse(null);
		} catch (DateTimeParseException e) {
			return "31-08-2012";
		}
	}

	public static String transformDateOrDefault(String date, String sourceFormat) {
		try {
			DateTimeFormatter sourceFormatter = DateTimeFormatter.ofPattern(sourceFormat);

			return Optional.ofNullable(date).map(d -> LocalDate.parse(date, sourceFormatter).format(DATE_FORMATTER))
					.orElse(null);
		} catch (DateTimeParseException e) {
			return null;
		}
	}
}
