import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color colorWhite = Colors.white;
  static Color colorBlack = const Color(0xff222222);
  static Color colorPurple = const Color(0xff7B4397);
  static Color colorPurpleLight = const Color(0xff9F5DE2);
  static Color colorGreyLight = const Color(0xffdbd9d9);
  static Color colorGrey = const Color(0xff909090);
  static Color errorColor = Colors.red;

  static InputDecoration inputDec1 = InputDecoration(
    contentPadding: const EdgeInsets.all(8),
    fillColor: Styles.colorGrey.withOpacity(0.05),
    filled: true,
    labelStyle:
        GoogleFonts.nunito(color: Styles.colorGrey, fontWeight: FontWeight.w600, fontSize: 16),
    errorStyle: const TextStyle(
      color: Color(0xff222222),
    ),
    focusedBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Color(0xff082485), width: 1.7)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Styles.colorBlack.withOpacity(0.2), width: 2),
    ),
    border: const OutlineInputBorder(),
    counterText: '',
  );

  void doNothing() {}
}
