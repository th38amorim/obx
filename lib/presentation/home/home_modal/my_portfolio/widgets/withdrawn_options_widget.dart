import 'package:flutter/material.dart';

class WithdrawalOptionsWidget extends StatelessWidget {
  const WithdrawalOptionsWidget({
    Key? key,
    required this.onPressed,
    required this.groupValue,
    required this.value, 
    required this.label, 
    this.description = '',
  }) : super(key: key);

  final void Function(int?)? onPressed;
  final int? groupValue;
  final int? value;
  final String label;
  final String description;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: _isSelected ? Color(0xFF51515E) : Color(0xFFF5F5F9),
          ),
          child: ElevatedButton(
            onPressed: () => onPressed!(value),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: _isSelected ? Colors.white : Colors.black)),
                      const SizedBox(height: 3),
                      Visibility(
                        visible: description != '',
                        child: Text(description, style: TextStyle(color: _isSelected ? Colors.white54 : Colors.black54)),
                      ),
                    ],
                  ),
                  if (_isSelected) 
                    Icon(Icons.check, color: Colors.white38)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}