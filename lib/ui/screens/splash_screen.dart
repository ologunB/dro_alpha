import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxfund_alpha/core/view_models/startup_vm.dart';
import 'package:foxfund_alpha/ui/styles/spacing.dart';
import 'package:foxfund_alpha/utils/base_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (StartUpViewModel model) => model.isLoggedIn(),
      builder: (BuildContext context, StartUpViewModel model, _) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('images/logo.svg',
                  height: screenWidthFraction(context, dividedBy: 3))),
          verticalSpaceLarge,
          Text(
            'DRO Healths',
            style:
                GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
