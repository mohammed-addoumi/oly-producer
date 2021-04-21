package ma.cdgk.rest;

import java.util.HashMap;
import ma.cdgk.producer.starter.domain.exceptions.ErrorCode;
import ma.cdgk.rest.exceptions.ApplicationException;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {ApplicationException.class, ApplicationExceptionTest.class})
class ApplicationExceptionTest {

	@BeforeEach
	void setUp() {
		ApplicationException applicationException = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
	}

	@AfterEach
	void tearDown() {
	}

	@Test
	void getCode() {
		ApplicationException applicationException = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
		Assertions.assertNotNull(applicationException.getCode());
	}

	@Test
	void getMessage() {
		ApplicationException applicationException = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
		Assertions.assertNotNull(applicationException.getMessage());
	}

	@Test
	void getDescription() {
		ApplicationException applicationException = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
		Assertions.assertNotNull(applicationException.getDescription());
	}

	@Test
	void getHttpCode() {
		ApplicationException applicationException = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
		Assertions.assertEquals(0, applicationException.getHttpCode());
	}

	@Test
	void getData() {
		ApplicationException applicationException = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
		ApplicationException applicationException1 = new ApplicationException(new ErrorCode("", "", "", 0),
				new HashMap<>());
		Assertions.assertNotEquals(applicationException1, applicationException);
		Assertions.assertNotNull(applicationException.getData());
	}
}
