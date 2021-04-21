package ma.cdgk.infra;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URL;

public class EventTestUtils<T> {

	public T getEventDataByFileName(String fileName, Class<T> eventType) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
		return objectMapper.readValue(new URL("file:src/test/resources/eventfile/" + fileName + ".json"), eventType);
	}

	public T getEventDataByEventClass(Class<T> eventType) throws IOException {
		String fileName = eventType.getSimpleName() + "EventFileTest";
		return getEventDataByFileName(fileName, eventType);
	}

	public T getEnrichedEventDataByEventClass(Class<T> eventType) throws IOException {
		String fileName = eventType.getSimpleName() + "EnrichedEventFileTest";
		return getEventDataByFileName(fileName, eventType);
	}
}
