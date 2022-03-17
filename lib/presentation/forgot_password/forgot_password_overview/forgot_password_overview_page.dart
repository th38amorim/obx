import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/forgot_password_overview/widgets/phone_field_widget.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/forgot_password_overview/widgets/receive_code_button_widget.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/widgets/forgot_password_header_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                ForgotPasswordHeaderWidget(),
                const SizedBox(height: 30),
                Text('Esqueceu sua senha?', style: TextStyles.titles),
                PhoneFieldWidget(),
                ReceiveCodeButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
