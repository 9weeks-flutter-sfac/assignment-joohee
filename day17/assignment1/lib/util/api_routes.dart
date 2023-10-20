class ApiRoutes {
  static const String read =
      'http://52.79.115.43:8090/api/collections/users/records?sort=-created'; //user 리스트를 불러옴
  static const String login =
      'http://52.79.115.43:8090/api/collections/users/auth-with-password';
  static const String signup =
      'http://52.79.115.43:8090/api/collections/users/records';
  static const String secrets =
      'http://52.79.115.43:8090/api/collections/secrets/records?sort=-created';
  static const String upload =
      'http://52.79.115.43:8090/api/collections/secrets/records';
}
