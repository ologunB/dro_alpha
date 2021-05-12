import 'dart:async';

import 'package:foxfund_alpha/core/model/item.dart';

class ItemsApi {
  //get All Items
  Future<List<ItemModel>> getAllItems() async {
    try {
      // simulate loading/network delay
      await Future<void>.delayed(const Duration(seconds: 1));
      // since there's no api to get from, we fetch from a list locally stored
      return allItems;
    } catch (e) {
      throw 'Error';
    }
  }

  //search All Items
  Future<List<ItemModel>> searchAllItems(String a) async {
    try {
      final List<ItemModel> list = <ItemModel>[];
      for (final ItemModel val in allItems) {
        if (val.name.contains(a)) {
          list.add(val);
        }
      }
      // simulate loading/network delay
      await Future<void>.delayed(const Duration(milliseconds: 500));
      // since there's no api to get from, we fetch from a list locally stored
      return list;
    } catch (e) {
      throw 'Error';
    }
  }
}
