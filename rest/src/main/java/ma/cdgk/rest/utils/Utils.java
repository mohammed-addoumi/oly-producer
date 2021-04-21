package ma.cdgk.rest.utils;

public final class Utils {

	private static final String URL_PARAM_REGEX = "(\\{[^\\}]*\\})";

	private Utils() {
	}

	public static String constructUrlWithParams(String urlSpring, String... params) {
		for (String param : params) {
			urlSpring = urlSpring.replaceFirst(URL_PARAM_REGEX, param == null ? "" : param);
		}
		return urlSpring;
	}

	public static String numberToString(Number number) {
		return number == null ? null : number.toString();
	}
}
