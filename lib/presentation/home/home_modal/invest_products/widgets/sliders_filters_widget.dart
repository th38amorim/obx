import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class SlidersFiltersWidget extends StatefulWidget {
  const SlidersFiltersWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SlidersFiltersWidgetState createState() => _SlidersFiltersWidgetState();
}

class _SlidersFiltersWidgetState extends State<SlidersFiltersWidget> {

  double _rescueValue = 1;
  double _minimalApplicationValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text('Resgatar em', style: TextStyles.titles.copyWith(fontSize: 20)),
        const SizedBox(height: 10),
        Text('Até D+361', style: TextStyles.titles.copyWith(fontSize: 20)),
        const SizedBox(height: 20),
        Slider(
          value: _rescueValue, 
          onChanged: (double newValue) {
            setState(() {
              _rescueValue = newValue.roundToDouble();
            });
          },
          min: 0,  
          max: 10,  
          activeColor: primaryColor,
          inactiveColor: Colors.black12,  
        ),
        const SizedBox(height: 40),
        Text('Aplicação mínima', style: TextStyles.titles.copyWith(fontSize: 20)),
        const SizedBox(height: 10),
        Text('R\$ 500.000,00', style: TextStyles.titles.copyWith(fontSize: 20)),
        const SizedBox(height: 20),
        Slider(
          value: _minimalApplicationValue, 
          onChanged: (double newValue) {
            setState(() {
              _minimalApplicationValue = newValue.roundToDouble();
            });
          },
          min: 0,  
          max: 10,  
          activeColor: primaryColor,
          inactiveColor: Colors.black12,  
        ),
      ],
    );
  }
}