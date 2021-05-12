import 'package:flutter/cupertino.dart';
import 'package:foxfund_alpha/core/model/item.dart';
import 'package:foxfund_alpha/ui/widgets/snackbar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String kUserBoxName = 'userBox';
const String kSavedBox = 'saved01';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<List<dynamic>>(kUserBoxName);
  }

  static Box<List<dynamic>> get _box => Hive.box<List<dynamic>>(kUserBoxName);

  String a = '';

  static bool saveJsonData(BuildContext context,
      {@required Map<String, dynamic> data}) {
    if (data == null) {
      return false;
    }

    final List<dynamic> list = getSavedData();
    for (final dynamic item in list) {
      final ItemModel i = ItemModel.fromJson(item['product']);
      if (i.id == data['product']['id']) {
        showSnackBar(context, 'Error', 'Item Already Exist in the bag');
        return false;
      }
    }

    list.add(data);
    _box.put(kSavedBox, list);
    return true;
  }

  static void removeOne(int id) {
    if (id == null) {
      return;
    }

    final List<dynamic> list = getSavedData();
    for (int index = 0; index < list.length; index++) {
      final ItemModel i = ItemModel.fromJson(list[index]['product']);
      if (i.id == id) {
        list.removeAt(index);
      }
    }

    _box.put(kSavedBox, list);
  }

  static void clear() {
    _box.clear();
  }

  static void clean(String key) {
    _box.delete(key);
  }

  static List<dynamic> getSavedData() {
    final List<dynamic> data = _box.get(kSavedBox, defaultValue: <dynamic>[]);
    if (data == null) {
      return <Map<String, dynamic>>[];
    }
    final List<dynamic> list = List<dynamic>.from(data);
    return list;
  }
}
