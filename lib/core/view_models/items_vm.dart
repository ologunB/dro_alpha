import 'package:foxfund_alpha/core/api/items_api.dart';
import 'package:foxfund_alpha/core/model/item.dart';
import 'package:foxfund_alpha/utils/auth_exception.dart';

import '../../locator.dart';
import 'base_vm.dart';

class ItemsViewModel extends BaseModel {
  final ItemsApi _itemsApi = locator<ItemsApi>();

  String error;

  //get all items
  List<ItemModel> allItems;

  Future<void> getAllItems() async {
    setBusy(true);
    try {
      allItems = await _itemsApi.getAllItems();
      setBusy(false);
    } on AuthException catch (e) {
      setBusy(false);
      await dialog.showDialog(
          title: 'Error!', description: e.message, buttonTitle: 'Close');
      notifyListeners();
    }
  }
}
