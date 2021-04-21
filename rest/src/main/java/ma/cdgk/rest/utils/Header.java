package ma.cdgk.rest.utils;

import lombok.Getter;

@Getter
public enum Header {
	USER_PROFILE("X-USER-PROFILE"), X_TOKEN_ID("X-TOKEN-ID"), X_USER_UID("X-USER-UID");

	private final String code;

	Header(String code) {
		this.code = code;
	}
}
