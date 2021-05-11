import 'package:foxfund_alpha/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foxfund_alpha/utils/dialog_manager.dart';
import 'package:foxfund_alpha/utils/dialog_service.dart';
import 'package:foxfund_alpha/utils/navigator.dart';
import 'package:foxfund_alpha/utils/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/storage/local_storage.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init(); //Initialize Hive for Flutter
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: const SplashScreen(),
          builder: (BuildContext context, Widget child) => Navigator(
              key: locator<DialogService>().dialogNavigationKey,
              onGenerateRoute: (RouteSettings settings) =>
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          DialogManager(child: child))),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        ));
  }
}
