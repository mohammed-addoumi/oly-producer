package ma.cdgk.rest;

import ma.cdgk.producer.starter.domain.exceptions.ErrorCode;
import ma.cdgk.rest.exceptions.ApplicationRunTimeException;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {ApplicationRunTimeException.class, ApplicationRunTimeExceptionTest.class})
class ApplicationRunTimeExceptionTest {

	@Test
	void given_ApplicationRunTimeException_Expect_Nulls() {
		ApplicationRunTimeException applicationRunTimeException = new ApplicationRunTimeException();
		Assertions.assertNull(applicationRunTimeException.getCode());
		Assertions.assertNull(applicationRunTimeException.getDescription());
		Assertions.assertNull(applicationRunTimeException.getMessage());
		Assertions.assertEquals(0, applicationRunTimeException.getHttpCode());
	}

	@Test
	void given_ErroCode_Expect_ApplicationRunTimeException() {
		String code = "Error Code";
		ErrorCode errorCode = new ErrorCode(code, "Default Message", "", 404);
		ApplicationRunTimeException applicationRunTimeException = new ApplicationRunTimeException(errorCode);
		Assertions.assertEquals(404, applicationRunTimeException.getHttpCode());
		Assertions.assertEquals(code, applicationRunTimeException.getCode());
		Assertions.assertEquals("", applicationRunTimeException.getDescription());
		Assertions.assertEquals("Default Message", applicationRunTimeException.getMessage());
	}
}
