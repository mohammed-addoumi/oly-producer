package ma.cdgk.rest.filters;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import ma.cdgk.producer.starter.domain.exceptions.DomainException;
import ma.cdgk.producer.starter.domain.utils.MessageByLocaleService;
import ma.cdgk.rest.exceptions.ApplicationException;
import ma.cdgk.rest.exceptions.ApplicationRunTimeException;
import ma.cdgk.rest.utils.ApiError;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
@AllArgsConstructor
public class ExceptionsHandler extends ResponseEntityExceptionHandler {

	private static final Logger log = LoggerFactory.getLogger(ExceptionsHandler.class);

	private MessageByLocaleService messageByLocaleService;

	@Override
	public ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
			final HttpHeaders headers, final HttpStatus status, final WebRequest request) {
		BindingResult result = ex.getBindingResult();

		List<ObjectError> allErrors = result.getAllErrors();

		return ResponseEntity.badRequest().body(processFieldErrors(allErrors));
	}

	@Override
	public ResponseEntity<Object> handleMissingServletRequestParameter(MissingServletRequestParameterException ex,
			HttpHeaders headers, HttpStatus status, WebRequest request) {
		ApiError error = new ApiError();
		error.addFieldError(ex.getParameterName(), ex.getLocalizedMessage());
		return ResponseEntity.badRequest().body(error);
	}

	private ApiError processFieldErrors(List<ObjectError> objectErrors) {
		ApiError error = new ApiError();
		for (ObjectError objectError : objectErrors) {

			if (objectError instanceof FieldError) {
				FieldError fieldError = (FieldError) objectError;
				error.addFieldError(fieldError.getField(),
						messageByLocaleService.getMessage(fieldError.getDefaultMessage()));
			} else {
				error.addFieldError(objectError.getObjectName(),
						messageByLocaleService.getMessage(objectError.getDefaultMessage()));
			}
		}
		return error;
	}

	@ExceptionHandler(value = {ApplicationException.class, ApplicationRunTimeException.class})
	public ResponseEntity<ApiError> handleApplicationException(ApplicationException exception) {

		List<String> data = Optional.ofNullable(exception.getData()).orElse(Collections.emptyMap()).entrySet().stream()
				.map(Map.Entry::getValue).collect(Collectors.toList());
		log.error("Exception Data {}", data);
		log.error("Exception Occured", exception);

		ApiError error = new ApiError();
		error.setCode(exception.getCode());

		error.setMessage(messageByLocaleService.getMessage(exception.getCode(), data.toArray(new String[0])));

		return new ResponseEntity<>(error, HttpStatus.valueOf(exception.getHttpCode()));
	}

	@ExceptionHandler(value = {DomainException.class})
	public ResponseEntity<ApiError> handleDomainException(DomainException exception) {

		List<String> data = Optional.ofNullable(exception.getData()).orElse(Collections.emptyMap()).entrySet().stream()
				.map(Map.Entry::getValue).collect(Collectors.toList());
		log.error("Exception Data {}", data);
		log.error("Exception Occured", exception);
		ApiError error = new ApiError();
		error.setCode(exception.getCode().getCode());
		error.setMessage(messageByLocaleService.getMessage(exception.getCode().getCode(), data.toArray(new String[0])));

		return new ResponseEntity<>(error, HttpStatus.valueOf(exception.getCode().getSuggestedHttpCode()));
	}
}
