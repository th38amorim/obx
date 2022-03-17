import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/new_password/new_password_page.dart';
import 'package:obenx_com_br_app/presentation/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ProceedButtonWidget extends StatelessWidget {
  const ProceedButtonWidget({
    Key? key,
  }) : super(key: key);

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
          onPressed: () => pushToPage(context, NewPasswordPage()),
          style: TextStyles.buttonStyle,
          child: Text('Prosseguir', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}