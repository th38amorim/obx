import 'package:flutter/material.dart';

class UserFieldWidget extends StatelessWidget {
  const UserFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Container(
        color: Color(0xFF51515E),
        child: Form(
          child: TextFormField(
            style: TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Usuário',
              hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}