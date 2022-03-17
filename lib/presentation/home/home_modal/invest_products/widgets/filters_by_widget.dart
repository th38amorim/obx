import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class FilterByRiskWidget extends StatelessWidget {
  const FilterByRiskWidget({
    Key? key,
    required this.onPressed,
    required this.groupValue,
    required this.value, 
    required this.label, 
    required this.gradient, 
  }) : super(key: key);

  final void Function(int?)? onPressed;
  final int? groupValue;
  final int? value;
  final String label;
  final Gradient? gradient;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onPressed!(value),
          child: Card(
            elevation: 0,
            color: backgroundDarkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: _isSelected ? primaryColor : backgroundDarkColor)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Container(
                width: 120,
                child: Row(
                  children: [
                    Container(
                      height: 20, 
                      width: 7, 
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(label, style: TextStyles.subtitles.copyWith(color: Colors.white70, fontSize: 14))
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}