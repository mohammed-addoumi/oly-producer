package ma.cdgk.infra.providers;

import java.util.Optional;
import ma.cdgk.domain.entities.Fdbtab;
import ma.cdgk.infra.eventrepositories.FdbtabRepository;
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
@ContextConfiguration(classes = {FdbtabProviderTest.class})
class FdbtabProviderTest {

	@Mock
	FdbtabRepository fdbtabRepository;

	@InjectMocks
	FdbtabProvider fdbtabProvider;

	int count = 0;

	@BeforeEach
	void init() {

		Fdbtab fdbtab2 = new Fdbtab();
		fdbtab2.setTbcode("Tbcode2");
		fdbtab2.setTbid("Tbid2");

		Mockito.doAnswer(new Answer() {
			public Object answer(InvocationOnMock invocation) {
				count++;
				return Optional.of(fdbtab2);
			}
		}).when(fdbtabRepository).findFirstByTbidAndTbcodeContaining("Tbid2", "Tbcode2");

		Mockito.when(fdbtabRepository.findFirstByTbidAndTbcodeContaining("Tbid1", "Tbcode1"))
				.thenReturn(Optional.empty());
	}

	@Test
	void should_Return_Ftbtab_When_Give_Id_And_Code() {
		Optional<Fdbtab> reponse = fdbtabProvider.getFdbtabByTbidAndTbcode("Tbid2", "Tbcode2");
		Assertions.assertNotNull(reponse.get());
		Fdbtab fdbtab = reponse.get();
		Assertions.assertEquals("Tbid2", fdbtab.getTbid());
		Assertions.assertEquals("Tbcode2", fdbtab.getTbcode());
	}

	@Test
	void should_Return_Empty_When_Give_Not_Found() {
		Optional<Fdbtab> reponse = fdbtabProvider.getFdbtabByTbidAndTbcode("Tbid1", "Tbcode1");
		Assertions.assertTrue(reponse.isEmpty());
	}
}
