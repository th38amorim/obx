import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/code_confirmation/code_confirmation_page.dart';
import 'package:obenx_com_br_app/presentation/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ReceiveCodeButtonWidget extends StatelessWidget {
  const ReceiveCodeButtonWidget({
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
          onPressed: () => pushToPage(context, CodeConfirmationPage()),
          style: TextStyles.buttonStyle,
          child: Text('Receber código', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}