import 'package:dio/dio.dart';

class LoggingInterCeptors implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(err.message);
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('----- Request -----');
    if (options.method == 'GET') {
      print('get method');
    } else if (options.method == "PUT") {
      print("----- PUT -----");
    } else if (options.method == "POST") {
      print("----- POST -----");
    } else {
      print("----- Data -----");
      print(options.data.toString());
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('----- Response -----');
    print(response.data);
    print('status code: ${response.statusCode}');
    handler.next(response);
  }
}
