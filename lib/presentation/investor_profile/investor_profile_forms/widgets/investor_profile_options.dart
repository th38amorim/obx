import 'package:flutter/material.dart';

class OptionsInvestorProfile extends StatelessWidget {
  const OptionsInvestorProfile({
    Key? key, required this.label, required this.value, required this.groupValue, required this.onChanged,
  }) : super(key: key);

  final String label;
  final int value;
  final int groupValue;
  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Radio(
                  value: value, 
                  groupValue: groupValue, 
                  onChanged: onChanged, 
                  activeColor: Colors.grey,
                ),
                Expanded(child: Text(label, style: TextStyle(color: Color(0xFF8F8F97), fontSize: 16))),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class OptionsCurrentActives extends StatelessWidget {
  const OptionsCurrentActives({ Key? key, required this.onChanged, required this.label, required this.value}) : super(key: key);

  final String label;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CheckboxListTile(
          title: Text(label, style: TextStyle(color: Colors.black38)),
          activeColor: Colors.black38,
          value: value,
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}