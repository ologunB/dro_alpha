import 'package:foxfund_alpha/utils/routes.dart';

import 'base_vm.dart';

class StartUpViewModel extends BaseModel {
  Future<void> isLoggedIn() async {
    Future<void>.delayed(const Duration(seconds: 3), () {
      navigate.navigateToReplacing(MainLayoutView);
    });
    notifyListeners();
  }
}
