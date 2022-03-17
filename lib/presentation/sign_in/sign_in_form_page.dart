import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/sign_in/widgets/forgot_password_button_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_in/widgets/login_button_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_in/widgets/open_account_button_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_in/widgets/password_field_widget.dart';
import 'package:obenx_com_br_app/presentation/sign_in/widgets/user_field_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';
class SignInFormPage extends StatelessWidget {
  const SignInFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/obenx_logo.png', height: 150),
              ),
              UserFieldWidget(),
              PasswordFieldWidget(),
              LoginButtonWidget(),
              ForgotPasswordButtonWidget(),
              OpenAccountButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}