import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  DioHelper(BaseOptions baseOptions);

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getdata(
      {required String url, required dynamic query}) async {
    return await dio?.get(url, queryParameters: query);
  }
}
