package ma.cdgk.rest;

import ma.cdgk.rest.utils.Utils;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {Utils.class, UtilsTest.class})
class UtilsTest {

	@Test
	void given_UrlWith_And_Params_Expect_UrlWithParams() {
		Assert.assertEquals("url\\param1\\param2", Utils.constructUrlWithParams("url\\{}\\{}", "param1", "param2"));
	}

	@Test
	void given_Number_Expect_StringNumber() {
		Number number = 3890123;
		Assert.assertEquals("3890123", Utils.numberToString(number));
	}

	@Test
	void given_NullNumber_Expect_NullResponse() {
		Number number = null;
		Assert.assertNull(Utils.numberToString(number));
	}
}
