import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class HomeHeaderWidget extends StatelessWidget {
  HomeHeaderWidget({
    Key? key,
  }) : super(key: key);

  static DateTime now = DateTime.now();
  static List months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
  final currentMonth = now.month;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 20, 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Olá,\n', style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                TextSpan(text: 'Gabriela', style: TextStyles.personName),
              ],
            ),
          ),
          Text(now.day.toString() + ' de ' + months[(currentMonth - 1)].toString() + ', ' + now.year.toString()),
        ],
      ),
    );
  }
}