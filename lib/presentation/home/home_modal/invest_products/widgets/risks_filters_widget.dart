import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/invest_products/widgets/filters_by_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class RisksFiltersWidget extends StatefulWidget {
  const RisksFiltersWidget({
    Key? key,
  }) : super(key: key);

  @override
  _RisksFiltersWidgetState createState() => _RisksFiltersWidgetState();
}

class _RisksFiltersWidgetState extends State<RisksFiltersWidget> {

  int? val = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterByRiskWidget(
          label: 'Conservador',
          gradient: TextStyles.gradientBlueColor,
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 1, 
        ),
        FilterByRiskWidget(
          label: 'Moderado',
          gradient: TextStyles.gradientPurpleColor,
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 2, 
        ),
        FilterByRiskWidget(
          label: 'Sofisticado',
          gradient: TextStyles.gradientRedColor,
          onPressed: (value) {
            setState(() {
              val = value;
            });
          }, 
          groupValue: val, 
          value: 3, 
        ),
      ],
    );
  }
}