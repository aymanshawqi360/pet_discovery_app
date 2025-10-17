abstract class ApiConsumer {
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParametes,
  });
}
