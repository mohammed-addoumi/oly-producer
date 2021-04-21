package ma.cdgk.rest;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import ma.cdgk.producer.starter.domain.exceptions.DomainException;
import ma.cdgk.producer.starter.domain.exceptions.ErrorCode;
import ma.cdgk.producer.starter.domain.utils.MessageByLocaleService;
import ma.cdgk.rest.exceptions.ApplicationException;
import ma.cdgk.rest.filters.ExceptionsHandler;
import ma.cdgk.rest.filters.GlobalExceptionsHandler;
import ma.cdgk.rest.utils.ApiError;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.validation.BindingResult;
import org.springframework.validation.MapBindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.context.request.WebRequest;

@ExtendWith(MockitoExtension.class)
@SpringBootTest
@ContextConfiguration(classes = {GlobalExceptionsHandler.class, ExceptionsHandler.class,
		ExceptionHandlersTest.Config.class})
class ExceptionHandlersTest {

	@Mock
	MessageByLocaleService messageByLocaleService;

	@Autowired
	GlobalExceptionsHandler globalExceptionsHandler;

	@InjectMocks
	ExceptionsHandler exceptionsHandler;

	@BeforeEach
	void intit() {
		Mockito.lenient()
				.when(messageByLocaleService.getMessage(ArgumentMatchers.anyString(), ArgumentMatchers.anyString()))
				.thenReturn("Mocked Message from messageByLocalService");
	}

	@Test
	void given_GlobalException_Expect_ApiError() {
		String exceptionMsg = "Test Exception";
		ResponseEntity<ApiError> apiErrorResponseEntity = globalExceptionsHandler
				.handleException(new Exception(exceptionMsg));
		Assertions.assertEquals(HttpStatus.BAD_REQUEST, apiErrorResponseEntity.getStatusCode());
		Assertions.assertEquals(exceptionMsg, apiErrorResponseEntity.getBody().getMessage());
		Assertions.assertEquals("err.global", apiErrorResponseEntity.getBody().getCode());
	}

	@Test
	void given_ApplicationContextException_Expect_ErrorCodecAndHTTPStatus() {
		Map<Integer, String> data = new HashMap<>();
		data.put(0, "param0");
		String code = "Error Code";
		ErrorCode errorCode = new ErrorCode(code, "Default Message", "", 404);
		ApplicationException applicationException = new ApplicationException(errorCode, data);
		ResponseEntity<ApiError> response = exceptionsHandler.handleApplicationException(applicationException);
		Assertions.assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
		Assertions.assertEquals("Mocked Message from messageByLocalService", response.getBody().getMessage());
	}

	@Test
	void given_DomainContextException_Expect_ErrorCodecAndHTTPStatus() {
		Map<Integer, String> data = new HashMap<>();
		data.put(0, "param0");
		ErrorCode errorCode = new ErrorCode("Code Error", "Default Message ", "Description", 400);
		ResponseEntity<ApiError> response = exceptionsHandler
				.handleDomainException(new DomainException(data, errorCode));
		Assertions.assertEquals(HttpStatus.BAD_REQUEST, response.getStatusCode());
		Assertions.assertEquals("Mocked Message from messageByLocalService", response.getBody().getMessage());
	}

	@Test
	void given_MethodArgumentNotValidException_Expect_Api_Error() throws Exception {
		BindingResult bindingResult = new MapBindingResult(Collections.singletonMap("a", "b"), "objectName");
		bindingResult.addError(new ObjectError("c", "d"));
		MethodArgumentNotValidException ex = new MethodArgumentNotValidException(null, bindingResult);
		HttpHeaders httpHeaders = null;
		HttpStatus httpStatus = HttpStatus.BAD_REQUEST;
		WebRequest webRequest = null;
		ResponseEntity resp = exceptionsHandler.handleMethodArgumentNotValid(ex, httpHeaders, httpStatus, webRequest);
		Assertions.assertEquals(400, resp.getStatusCode().value());
	}

	@TestConfiguration
	public static class Config {
		@Bean
		MessageByLocaleService messageByLocaleService() {
			return Mockito.mock(MessageByLocaleService.class);
		}
	}
}
