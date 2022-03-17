import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class WithdrawalProceedButton extends StatelessWidget {
  const WithdrawalProceedButton({
    Key? key, required this.nextPage, this.buttonLabel = 'Continuar',
  }) : super(key: key);

  final String buttonLabel;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100 ,
      left: 102,
      child: Container(
        decoration: BoxDecoration(
          gradient: TextStyles.gradientColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          onPressed: () {
            pushToPage(context, nextPage);
          },
          style: TextStyles.buttonStyle,
          child: Text(buttonLabel, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}