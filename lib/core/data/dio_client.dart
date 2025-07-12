import 'package:dio/dio.dart';

class DioClient {
  static Dio getDioClient(
    String baseUrl,
    Map<String, String> headerParams,
  ) {
    final client = Dio();
    client.options
      ..baseUrl = baseUrl
      ..headers = headerParams
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 20);
    client.interceptors.clear();
    client.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          // final token = localRepository.getToken();
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException e, handler) => handler.next(e),
      ),
    );
    return client;
  }
}
