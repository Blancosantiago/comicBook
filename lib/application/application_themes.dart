import 'package:comicslibrary/core/helper/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ApplicationThemes {
  static ThemeData appTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light().copyWith(
            primary: HexColor.fromHex('#6379BF'),
            secondary: Colors.grey.shade100,
            tertiary: const Color(0xFFFFFFFF),
            surface: HexColor.fromHex('#279989'),
            onSurface: HexColor.fromHex('#707070'),
            onBackground: HexColor.fromHex('#4B4B4B'),
            onPrimary: HexColor.fromHex('#4B4B4B'),
            background: HexColor.fromHex('#E0E0E0'),
            onSecondary: HexColor.fromHex('#F1F1F1')));
  }

  static TextStyle quickSandBold = GoogleFonts.quicksand(
      color: HexColor.fromHex('#4B4B4B'),
      fontSize: 16,
      fontWeight: FontWeight.bold);

  static TextStyle quickSandRegular = GoogleFonts.quicksand(
      color: HexColor.fromHex('#4B4B4B'),
      fontSize: 14,
      fontWeight: FontWeight.w400);

  static TextStyle quickSandMedium = GoogleFonts.quicksand(
      color: HexColor.fromHex('#4B4B4B'),
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static TextStyle quickSandSemiBold = GoogleFonts.quicksand(
      color: HexColor.fromHex('#4B4B4B'),
      fontSize: 14,
      fontWeight: FontWeight.w600);
}
