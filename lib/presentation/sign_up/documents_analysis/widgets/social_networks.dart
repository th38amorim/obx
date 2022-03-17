import 'package:flutter/material.dart';

class SocialNetworksWidget extends StatelessWidget {
  const SocialNetworksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 30,
          width: 30,
          child: Image.asset('assets/logo-linkedin.png'),
        ),
        Container(
          height: 30,
          width: 30,
          child: Image.asset('assets/logo-instagram.png'),
        ),
        Container(
          height: 30,
          width: 30,
          child: Image.asset('assets/logo-facebook.png'),
        ),
        Container(
          height: 30,
          width: 30,
          child: Image.asset('assets/logo-youtube.png'),
        ),
      ],
    );
  }
}
