import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class OrderByWidget extends StatefulWidget {
  const OrderByWidget({
    Key? key,
  }) : super(key: key);

  @override
  _OrderByWidgetState createState() => _OrderByWidgetState();
}

class _OrderByWidgetState extends State<OrderByWidget> {

  int? val = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      children: [
        OrderByCardWidget(
          label: 'R. Mês',
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 1, 
        ),
        OrderByCardWidget(
          label: 'R. Ano',
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 2, 
        ),
        OrderByCardWidget(
          label: 'R. 12 meses',
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 3, 
        ),
        OrderByCardWidget(
          label: 'Aplicação mínima',
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 4, 
        ),
      ],
    );
  }
}

class OrderByCardWidget extends StatelessWidget {
  const OrderByCardWidget({
    Key? key,
    required this.onPressed,
    required this.groupValue,
    required this.value, 
    required this.label, 
  }) : super(key: key);

  final void Function(int?)? onPressed;
  final int? groupValue;
  final int? value;
  final String label;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(value),
      child: Card(
        elevation: 0,
        color: _isSelected ? primaryColor : backgroundDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: primaryColor)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(label, style: TextStyles.subtitles.copyWith(fontSize: 14, color: _isSelected ? Colors.black : Colors.white54,)),
        ),
      ),
    );
  }
}