import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/forgot_password/code_confirmation/widgets/code_field_widget.dart';
import 'package:obx_com_br_app/presentation/forgot_password/code_confirmation/widgets/proceed_button_widget.dart';
import 'package:obx_com_br_app/presentation/forgot_password/widgets/forgot_password_header_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class CodeConfirmationPage extends StatelessWidget {
  const CodeConfirmationPage({Key? key}) : super(key: key);

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
                CodeFieldWidget(),
                ProceedButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}