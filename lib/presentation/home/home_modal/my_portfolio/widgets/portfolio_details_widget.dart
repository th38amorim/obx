import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class PortfolioDetailsWidget extends StatelessWidget {
  const PortfolioDetailsWidget({
    Key? key, this.label = '', required this.labelField, this.darkMode = true, this.description = '', this.valueInEnd = '',
  }) : super(key: key);

  final String label;
  final String labelField;
  final String description;
  final String valueInEnd;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: label != '',
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(label, style: TextStyles.titles.copyWith(fontSize: 18)),
          ),
        ),
        const SizedBox(height: 5),
        Card(
          color: darkMode ? Color(0xFF5D5D61) : Colors.white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: valueInEnd != '' 
                          ? Text(labelField, style: TextStyles.titles.copyWith(fontSize: 18, color: Colors.white))
                          : Text(labelField, style: TextStyles.titles.copyWith(fontSize: 18, color: darkMode ? Colors.white54  : Colors.black))
                      ),
                      Visibility(
                        visible: valueInEnd != '',
                        child: Text(valueInEnd, style: TextStyles.subtitles.copyWith(fontSize: 16, color: Colors.white54)),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: description != '',
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          description, style: TextStyles.subtitles.copyWith(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: description != '' || valueInEnd != '' ? 0 : 20),
      ],
    );
  }
}