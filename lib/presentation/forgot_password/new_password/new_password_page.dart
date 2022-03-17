import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/new_password/widgets/confirm_new_password_widget.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/new_password/widgets/login_with_new_password_button_widget.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/new_password/widgets/new_password_field_widget.dart';
import 'package:obenx_com_br_app/presentation/forgot_password/widgets/forgot_password_header_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                ForgotPasswordHeaderWidget(),
                const SizedBox(height: 30),
                Text('Cadastre sua nova senha', style: TextStyles.titles),
                NewPasswordFieldWidget(),
                ConfirmNewPasswordWidget(),
                LoginWithNewPasswordButtonWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
