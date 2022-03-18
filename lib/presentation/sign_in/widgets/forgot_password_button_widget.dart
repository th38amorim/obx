import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/forgot_password/forgot_password_overview/forgot_password_overview_page.dart';
import 'package:obx_com_br_app/presentation/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: () => pushToPage(context, ForgotPasswordPage()),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(2),
            fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundDarkColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(25)))),
          ),
          child: Text('Esqueci minha senha'),
      ),
    );
  }
}