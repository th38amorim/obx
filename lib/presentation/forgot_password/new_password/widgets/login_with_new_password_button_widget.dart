import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class LoginWithNewPasswordButtonWidget extends StatelessWidget {
  const LoginWithNewPasswordButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: Container(
        decoration: BoxDecoration(
          gradient: TextStyles.gradientColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
            onPressed: () {},
            style: TextStyles.buttonStyle,
            child: Text('Entrar', style: TextStyle(color: Colors.black))),
      ),
    );
  }
}
