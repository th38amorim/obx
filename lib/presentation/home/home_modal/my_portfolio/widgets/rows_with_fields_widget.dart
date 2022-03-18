import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/fields_label_widget.dart';


class RowsWithFields extends StatelessWidget {
  const RowsWithFields({
    Key? key, required this.columnWidget,
  }) : super(key: key);

  final List<FieldsLabel> columnWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: columnWidget,
    );
  }
}