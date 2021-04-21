package ma.cdgk.rest;

import ma.cdgk.rest.utils.ApiError;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {ApiErrorTest.class, ApiError.class})
class ApiErrorTest {

	@Test
	void should_Add_Error() {
		ApiError apiError = new ApiError();
		String errorName = "Error1";
		String errorMessage = "Message of Error 1";
		Assert.assertEquals(0, apiError.getAttributeErrors().size());
		apiError.addFieldError(errorName, errorMessage);
		Assert.assertEquals(1, apiError.getAttributeErrors().size());
		Assert.assertEquals(new ApiError.Error(errorName, errorMessage), apiError.getAttributeErrors().get(0));
	}
}
