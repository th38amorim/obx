import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class AccountDataItens extends StatelessWidget {
  const AccountDataItens({
    Key? key,
    required this.field,
    required this.label,
  }) : super(key: key);

  final String field;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: backgroundDarkColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(field, style: TextStyles.subtitles.copyWith(fontSize: 16, color: Colors.white)),
                const SizedBox(height: 7),
                Text(label, style: TextStyles.subtitles.copyWith(fontSize: 16)),
                Divider(height: 15, thickness: 0.5, color: primaryColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}