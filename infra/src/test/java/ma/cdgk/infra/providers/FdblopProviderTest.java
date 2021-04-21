package ma.cdgk.infra.providers;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

import java.util.Optional;
import ma.cdgk.domain.entities.Fdblop;
import ma.cdgk.infra.eventrepositories.FdblopRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class FdblopProviderTest {

	@Mock
	FdblopRepository fdblopRepository;

	@InjectMocks
	FdblopProvider fdblopProvider;

	@Test
	void Should_returnOptionalOfObject() {
		when(fdblopRepository.findByOpidAndOpnope(anyString(), anyString()))
				.thenReturn(Optional.ofNullable(new Fdblop()));

		Optional<Fdblop> expectedFdblop = fdblopProvider.getOperationByByOpidAndOpnope("", "");

		assertThat(expectedFdblop).isNotEmpty();
	}

}
