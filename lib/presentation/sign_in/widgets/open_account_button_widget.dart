import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/sign_up/sign_up_scaffold_page.dart';

class OpenAccountButtonWidget extends StatelessWidget {
  const OpenAccountButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: () {
            NumberFormController.currentForm = 0;
            pushToPage(context, SignUpScaffoldPage());
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(2),
            fixedSize: MaterialStateProperty.all<Size>(Size(190, 45)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF51515E)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
          ),
          child: Text('Abrir minha conta'),
      ),
    );
  }
}