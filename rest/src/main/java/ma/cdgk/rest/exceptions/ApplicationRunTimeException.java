package ma.cdgk.rest.exceptions;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import ma.cdgk.producer.starter.domain.exceptions.ErrorCode;

@Getter
@EqualsAndHashCode(callSuper = false)
public class ApplicationRunTimeException extends RuntimeException {
	private final String code;
	private final String message;
	private final String description;
	private final int httpCode;

	public ApplicationRunTimeException() {
		code = null;
		message = null;
		description = null;
		httpCode = 0;
	}

	public ApplicationRunTimeException(ErrorCode errorCode) {
		super(errorCode.getDefaultMessage());
		this.code = errorCode.getCode();
		this.message = errorCode.getDefaultMessage();
		this.description = errorCode.getDefaultDescription();
		this.httpCode = errorCode.getSuggestedHttpCode();
	}
}
