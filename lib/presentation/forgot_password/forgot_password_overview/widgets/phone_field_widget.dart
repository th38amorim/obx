import 'package:flutter/material.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
    Text('Nós ajudamos a recuperar', style: TextStyle(color: Colors.grey, fontSize: 18)),
    Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        color: Color(0xFF51515E),
        child: Form(
          child: TextFormField(
            style: TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Celular',
              hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ),
    ],);
  }
}