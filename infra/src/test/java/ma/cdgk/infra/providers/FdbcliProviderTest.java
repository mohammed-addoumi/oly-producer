package ma.cdgk.infra.providers;

import java.util.Optional;
import ma.cdgk.domain.entities.Fdbcli;
import ma.cdgk.infra.eventrepositories.FdbcliRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {FdbcliProviderTest.class,})
class FdbcliProviderTest {

	@Mock
	FdbcliRepository fdbcliRepository;

	@InjectMocks
	FdbcliProvider fdbcliProvider;

	int count = 0;

	@BeforeEach
	void init() {
		Fdbcli fdbcli1 = new Fdbcli();
		fdbcli1.setClraci("clarci1");
		Mockito.when(fdbcliRepository.findByClraci("clarci1")).thenReturn(Optional.of(fdbcli1));
		Fdbcli fdbcli2 = new Fdbcli();
		fdbcli2.setClraci("clarci2");
		Mockito.doAnswer(new Answer() {
			public Object answer(InvocationOnMock invocation) {
				count++;
				return Optional.of(fdbcli2);
			}
		}).when(fdbcliRepository).findByClraci("clarci2");
	}

	@Test
	void getClientByClraci_Should_Return_Fdbcli_When_Found() {
		Fdbcli response = fdbcliProvider.getClientByClraci("clarci1").get();
		Assertions.assertNotNull(response);
		Assertions.assertEquals("clarci1", response.getClraci());
		response = fdbcliProvider.getClientByClraci("clarci2").get();
		Assertions.assertNotNull(response);
		Assertions.assertEquals("clarci2", response.getClraci());
	}

	@Test
	void getClientByClraci_Should_Return_Empty_When_NotFound() {
		Mockito.when(fdbcliRepository.findByClraci(ArgumentMatchers.anyString())).thenReturn(Optional.empty());
		Optional<Fdbcli> response = fdbcliProvider.getClientByClraci("clarci3");
		Assertions.assertTrue(response.isEmpty());
	}
}
