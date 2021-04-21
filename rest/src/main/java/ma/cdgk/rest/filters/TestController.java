package ma.cdgk.rest.filters;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "/")
public class TestController {

	@GetMapping(value = "test")
	public String gettter() {
		return "test";
	}
}
