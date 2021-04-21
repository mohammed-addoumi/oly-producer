package ma.cdgk.infra;

import java.util.NoSuchElementException;
import ma.cdgk.domain.entities.FdbcptStatut;
import org.junit.Assert;
import org.junit.jupiter.api.Test;

class FdbcptStatutTest {

	@Test
	void given_Code_Expect_ActiveStatus() {
		Assert.assertEquals(FdbcptStatut.ACTIF, FdbcptStatut.getByCode("M"));
		Assert.assertEquals(FdbcptStatut.ACTIF, FdbcptStatut.getByCode("  M  "));
		Assert.assertEquals(FdbcptStatut.ACTIF, FdbcptStatut.getByCode("P"));
		Assert.assertEquals(FdbcptStatut.ACTIF, FdbcptStatut.getByCode(""));
	}

	@Test
	void given_Code_Expect_ClotureStatus() {
		Assert.assertEquals(FdbcptStatut.CLOTURE, FdbcptStatut.getByCode("A"));
		Assert.assertEquals(FdbcptStatut.CLOTURE, FdbcptStatut.getByCode(" A "));
		Assert.assertEquals(FdbcptStatut.BLOQUE, FdbcptStatut.getByCode("B"));
	}

	@Test
	void given_InvalidCode_Expect_NoSuchElementException() {
		Assert.assertThrows(NoSuchElementException.class, () -> {
			FdbcptStatut.getByCode("CC");
		});
	}

}
