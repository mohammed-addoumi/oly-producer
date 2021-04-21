package ma.cdgk.infra;

import ma.cdgk.infra.config.ServiceProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.TestPropertySource;

@EnableConfigurationProperties({ServiceProperties.class})
@Configuration
@TestPropertySource(locations = "classpath:config/application.yml")
public class TestBaseConfig {
}
