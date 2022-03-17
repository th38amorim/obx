import 'package:flutter/material.dart';

class ForgotPasswordHeaderWidget extends StatelessWidget {
  const ForgotPasswordHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset('assets/obenx_logo.png', scale: 2),
        ),
      ],
    );
  }
}