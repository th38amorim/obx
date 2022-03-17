import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _obscureText = true;

  void _passwordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Container(
            color: Color(0xFF51515E),
            child: TextFormField(
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: GestureDetector(
                onTap: _passwordView,
                child: Container(
                  height: 25,
                  width: 25,
                  child: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined ,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
