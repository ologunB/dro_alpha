
import 'package:foxfund_alpha/core/api/providers_from_api.dart';
import 'package:foxfund_alpha/utils/auth_exception.dart';

import '../../locator.dart';
import 'base_vm.dart';

class ProvidersViewModel extends BaseModel {
  final ProviderFromApi _providerFromApi = locator<ProviderFromApi>();

  String error;

  //create a provider
  Future<void> createProvider(Map<String, dynamic> data) async {
    setBusy(true);
    try {
      final String result = await _providerFromApi.createFromApi(data);
      if (result == 'Success') {
        setBusy(false);
        await dialog.showDialog(
            title: 'Success', description: 'Provider has been created!', buttonTitle: 'Close');
        notifyListeners();
        return 'Success';
      }
    } on AuthException catch (e) {
      setBusy(false);
      await dialog.showDialog(title: 'Error!', description: e.message, buttonTitle: 'Close');
      notifyListeners();
    }
  }

}
