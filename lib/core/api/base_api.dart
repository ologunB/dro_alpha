import 'package:dio/dio.dart';

class BaseAPI {
  Dio dio = Dio();
  String baseUrl = 'https://pro-zone.herokuapp.com';
  Options defaultOptions =
      Options(contentType: 'application/json', validateStatus: (int status) => status < 500);

  String getIdToken() {
    const String token = '..-_Cc0';
    return token;
  }
}
