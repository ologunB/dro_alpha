import 'dart:async';

import 'package:dio/dio.dart';
import 'package:foxfund_alpha/utils/auth_exception.dart';
import 'package:foxfund_alpha/utils/constants/messages.dart';
import 'package:foxfund_alpha/utils/error_util.dart';

import 'base_api.dart';

class ProviderFromApi extends BaseAPI {
  //create a provider
  Future<String> createFromApi(Map<String, dynamic> data) async {
    final String token = getIdToken();
    try {
      final Response<Map<String, dynamic>> res = await dio.post<Map<String, dynamic>>(
          '$baseUrl/providers',
          data: data,
          options:
              defaultOptions.copyWith(headers: <String, String>{'Authorization': 'Bearer $token'}));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            return 'Success';
          } catch (e) {
            throw AuthException('Server is currently under maintenance, Try again later');
          }
          break;
        default:
          throw AuthException(res.data['message'] as String);
      }
    } catch (e) {
      throw AuthException(DioErrorUtil.handleError(e));
    }
  }
}
