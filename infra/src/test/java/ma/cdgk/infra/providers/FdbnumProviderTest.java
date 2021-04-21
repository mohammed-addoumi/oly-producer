package ma.cdgk.infra.providers;

import ma.cdgk.domain.entities.Fdbnum;
import ma.cdgk.infra.eventrepositories.FdbnumRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = {FdbnumProviderTest.class,})
class FdbnumProviderTest {

	@Mock
	FdbnumRepository fdbnumRepository;

	@InjectMocks
	FdbnumProvider fdbnumProvider;

	int count = 0;

	@BeforeEach
	void init() {

		Fdbnum fdbnum2 = new Fdbnum();
		fdbnum2.setNuniv("Nuniv2");

		Mockito.doAnswer(new Answer() {
			public Object answer(InvocationOnMock invocation) {
				count++;
				return java.util.Optional.of(fdbnum2);
			}
		}).when(fdbnumRepository).findByNuraciAndNugreAndNurubAndNumonAndNutype("nuraci2", "nugre2", "nurub2", "numon2",
				"nuType2");
	}

	@Test
	void should_Return_Fdbnum() {
		Fdbnum response = fdbnumProvider
				.getFdbnumByNuraciAndNugreAndNurubAndNumonAndNutype("nuraci2", "nugre2", "nurub2", "numon2", "nuType2")
				.get();
		Assertions.assertNotNull(response);
		Assertions.assertEquals("Nuniv2", response.getNuniv());
	}
}
