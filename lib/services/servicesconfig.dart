class ServicesConfig {
  static String baseUrl =
      "https://pixabay.com/api/?key=15953326-28c6274802a723813fd561d84&q=";
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Duration timeOutLimit = const Duration(seconds: 20);
}
