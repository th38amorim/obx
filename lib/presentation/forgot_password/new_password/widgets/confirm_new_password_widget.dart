import 'package:flutter/material.dart';

class ConfirmNewPasswordWidget extends StatefulWidget {
  const ConfirmNewPasswordWidget({Key? key}) : super(key: key);

  @override
  _ConfirmNewPasswordWidgetState createState() => _ConfirmNewPasswordWidgetState();
}

bool _obscureText = false;

class _ConfirmNewPasswordWidgetState extends State<ConfirmNewPasswordWidget> {
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
                hintText: 'Confirmar senha',
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 300,
            child: GestureDetector(
              onTap: _passwordView,
              child: Container(
                height: 25,
                width: 25,
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  color: Colors.grey[400],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
