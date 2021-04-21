package ma.cdgk.rest.constants;

public final class ResourcePaths {

	public static final String BASE_URL = "/cdgk/api/v1";

	private ResourcePaths() {
	}

	public static final class Users {

		public static final String ENDPOINT_API_USERS = BASE_URL + "/users";
		public static final String ENDPOINT_API_USERS_ONE_USER = ENDPOINT_API_USERS + "/{user_id}";

		private Users() {
		}

		public static final class PathVariales {
			public static final String USER_UID = "user_id";

			private PathVariales() {
			}
		}
	}

	public static final class Batchs {

		public static final String ENDPOINT_API_BATCHS = BASE_URL + "/batchs";

		private Batchs() {
		}

		public static final class PathVariales {

			private PathVariales() {
			}
		}
	}
}
