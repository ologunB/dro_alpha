import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String kUserBoxName = 'userBox';
const String kUserProfileKey = 'profile';

class AppStorage {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Map<String, dynamic>>(kUserBoxName);
  }

 // static Box<Map<String, dynamic>> get _box => Hive.box<Map<String, dynamic>>(kUserBoxName);


  void nothing() {}
}
