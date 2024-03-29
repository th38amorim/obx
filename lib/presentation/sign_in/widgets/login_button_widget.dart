import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_overview/home_overview_page.dart';
import 'package:obx_com_br_app/presentation/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        decoration: BoxDecoration(
          gradient: TextStyles.gradientColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          // onPressed: () => pushToPage(context, InvestorProfileOverviewPage()),
          onPressed: () => pushToPage(context, HomeOverviewPage()),
          style: TextStyles.buttonStyle,
          child: const Text(
            'Acessar', style: 
            TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
