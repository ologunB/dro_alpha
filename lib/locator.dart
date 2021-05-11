import 'package:foxfund_alpha/core/view_models/providers_vm.dart';
import 'package:foxfund_alpha/utils/dialog_service.dart';
import 'package:foxfund_alpha/utils/navigator.dart';
 import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

 import 'core/api/providers_from_api.dart';
import 'core/view_models/startup_vm.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => StartUpViewModel());

  locator.registerLazySingleton(() => ProviderFromApi());
}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<ProvidersViewModel>(create: (_) => ProvidersViewModel())
];