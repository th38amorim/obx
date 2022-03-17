import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';


class FieldsLabel extends StatelessWidget {
  const FieldsLabel({
    Key? key, required this.label, required this.labelValue,
  }) : super(key: key);

  final String label;
  final String labelValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.subtitles.copyWith(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 5),
        Text(labelValue, style: TextStyles.subtitles.copyWith(color: Colors.black, fontSize: 16)),
        const SizedBox(height: 15),
      ],
    );
  }
}