import 'package:flutter/material.dart';

class CodeFieldWidget extends StatelessWidget {
  const CodeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          'Verifique seu dispositivo\nmóvel, nós enviamos um\ncódigo',
          style: TextStyle(color: Colors.grey, fontSize: 18),
          textAlign: TextAlign.center,
        ),
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Código de verificação',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}