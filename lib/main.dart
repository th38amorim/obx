import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obenx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
