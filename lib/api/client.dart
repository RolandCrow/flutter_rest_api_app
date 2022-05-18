
import 'package:dio/dio.dart';

Dio client() {
  Dio dio = Dio();

  String restAPIKey = "YOUR_REST_API_key";
  dio.options.baseUrl = "https://api.backendless.com/Your_Application_ID/$restAPIKey";
  dio.options.connectTimeout = 10000;
  dio.options.headers['Authorization'] = "some auth key";

  dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) => requestInterceptors(options),
    onResponse: (Response response) => responseInterceptors(response),
    onError: (DioError error) => errorInterceptors(error),)
  );

  return dio;

}

 requestInterceptors(RequestOptions options) {
    return options;
 }

responseInterceptors(Response response) {
  return response;
}

errorInterceptors(DioError error) {
  return error;
}

 