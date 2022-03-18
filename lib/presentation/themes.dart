import 'package:flutter/material.dart';

const primaryColor = const Color(0xFFDCCE9D);
const backgroundDarkColor = const Color(0xFF1F1E24);

class TextStyles {
  static TextStyle titles = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitles = TextStyle(
    fontSize: 18,
    color: Colors.white54,
  );

  static ButtonStyle buttonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(2),
    fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
  );

  static ButtonStyle darkButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(2),
    fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
    backgroundColor: MaterialStateProperty.all<Color>(backgroundDarkColor),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    ),
  );

  static TextStyle personName = TextStyle(
    fontSize: 25,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textConfirmPage = TextStyle(
    color: Color(0xFF51515E),
    fontSize: 16
  );

  static TextStyle subtitlePrimaryColor = TextStyle(
    fontSize: 20,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle infoMessage = TextStyle(
    color: Colors.white60,
    fontSize: 18,
  );

  static LinearGradient gradientColor = LinearGradient(
    colors: [
      Color(0xFFDDD09F),
      Color(0XFFC9A676),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradientColorTopToBottom = LinearGradient(
    colors: [
      Color(0xFFDDD09F),
      Color(0XFFC9A676),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient gradientBlueColor = LinearGradient(
    colors: [
      Color(0xFFCAE6FC),
      Color(0XFF03BEF7),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradientRedColor = LinearGradient(
    colors: [
      Color(0XFFEF8EC2),
      Color(0xFFF97758),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradientPurpleColor = LinearGradient(
    colors: [
      Color(0XFFE8890F6),
      Color(0xFF474B7F),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
