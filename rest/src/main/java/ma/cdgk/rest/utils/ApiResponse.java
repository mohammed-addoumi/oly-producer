package ma.cdgk.rest.utils;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
public class ApiResponse<T> {

	private String code;
	private String message;

	private T data;

	public ApiResponse(T body) {
		this.data = body;
	}

	public ApiResponse(String code, String message, T data) {
		this.code = code;
		this.message = message;
		this.data = data;
	}
}
