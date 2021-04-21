package ma.cdgk.rest.exceptions;

import ma.cdgk.producer.starter.domain.exceptions.DomainException;

public class DomainExceptionTranslator {

	private DomainExceptionTranslator() {
	}

	public static ApplicationException fromDomainException(DomainException exception) {
		return new ApplicationException(exception.getCode(), exception.getData());
	}
}
