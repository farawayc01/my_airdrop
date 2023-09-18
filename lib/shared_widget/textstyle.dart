import 'package:flutter/material.dart';

class CustomTextStyle {
  // Font family yang ingin Anda gunakan dari Google Fonts
  static const String defaultFontFamily = 'Poppins';

  // Ukuran teks default
  static const double defaultFontSize = 16.0;

  // Gaya teks default
  static const FontWeight defaultFontWeight = FontWeight.normal;
  static const FontStyle defaultFontStyle = FontStyle.normal;
  static const Color defaultFontColor = Colors.black;

  // Membuat gaya teks sesuai dengan properti yang diberikan
  static TextStyle getVtStyle({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? fontColor,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? defaultFontFamily,
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: fontWeight ?? defaultFontWeight,
      fontStyle: fontStyle ?? defaultFontStyle,
      color: fontColor ?? defaultFontColor,
    );
  }
}
