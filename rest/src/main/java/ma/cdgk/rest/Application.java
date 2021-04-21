package ma.cdgk.rest;

import java.net.InetAddress;
import java.util.Calendar;
import java.util.TimeZone;
import javax.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ComponentScan(basePackages = {"ma.cdgk"})
@SpringBootApplication
@EnableTransactionManagement
@EnableCaching
public class Application {

	private static final Logger log = LoggerFactory.getLogger(Application.class);

	@PostConstruct
	public void init() {
		TimeZone.setDefault(TimeZone.getTimeZone("Africa/Casablanca"));
	}

	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(Application.class);

		Environment env = app.run(args).getEnvironment();
		String protocol = "http";

		String hostAddress = "localhost";

		try {
			hostAddress = InetAddress.getLocalHost().getHostAddress();
		} catch (Exception e) {
			log.warn("The host name could not be determined, using `localhost` as fallback");
		}

		log.info(
				"\n----------------------------------------------------------\n\t"
						+ "{} '{}' is running! Access URLs:\n\t" + "Local: \t\t{}://localhost:{}\n\t"
						+ "External: \t{}://{}:{}\n\t" + "Profile(s): \t{}\n\t"
						+ "TimeZone: \t{}\n----------------------------------------------------------",
				Application.class.getName(), env.getProperty("spring.application.name"), protocol,
				env.getProperty("server.port"), protocol, hostAddress, env.getProperty("server.port"),
				env.getActiveProfiles(), Calendar.getInstance().getTimeZone().getID());
	}
}
