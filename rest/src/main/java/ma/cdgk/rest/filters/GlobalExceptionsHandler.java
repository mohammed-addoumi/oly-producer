package ma.cdgk.rest.filters;

import ma.cdgk.rest.utils.ApiError;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@Order(Ordered.LOWEST_PRECEDENCE)
public class GlobalExceptionsHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(GlobalExceptionsHandler.class);

	@ExceptionHandler(value = Exception.class)
	public ResponseEntity<ApiError> handleException(Exception exception) {

		LOGGER.error("Exception Occured", exception);

		ApiError error = new ApiError();
		error.setCode("err.global");
		error.setMessage(exception.getMessage());

		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}
}
