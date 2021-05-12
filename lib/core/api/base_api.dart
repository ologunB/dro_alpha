import 'package:dio/dio.dart';

class BaseAPI {
  Dio dio = Dio();
  String baseUrl = 'https://dro.herokuapp.com';
  Options defaultOptions =
      Options(contentType: 'application/json', validateStatus: (int status) => status < 500);
}
