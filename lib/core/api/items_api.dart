import 'dart:async';

import 'package:foxfund_alpha/core/model/item.dart';
import 'package:foxfund_alpha/utils/auth_exception.dart';
import 'package:foxfund_alpha/utils/error_util.dart';

import 'base_api.dart';

class ItemsApi extends BaseAPI {
  //get All Items
  Future<List<ItemModel>> getAllItems() async {
    try {
      // simulate loading/network delay
      await Future<void>.delayed(const Duration(seconds: 2));
      // since there's no api to get from, we fetch from a list locally stored
      return allItems;
    } catch (e) {
      throw AuthException(DioErrorUtil.handleError(e));
    }
  }
}
