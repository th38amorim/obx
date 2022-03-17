import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ObenxAppBar extends AppBar {

  ObenxAppBar({Key? key, Widget? leading, List<Widget>? actions, double? elevation, Widget? title, bool? centerTitle}) : super(
    key: key,
    title: title ?? Image.asset('assets/obenx_logo.png', width: 150),
    centerTitle: true,
    leading: leading,
    actions: actions,
    elevation: 0,
    toolbarHeight: 70,
    backgroundColor: backgroundDarkColor,
    actionsIconTheme: IconThemeData(
      size: 25
    ),
  );
}