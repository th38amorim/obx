import 'package:flutter/material.dart';
import 'package:obx_com_br_app/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/my_portfolio/widgets/rows_with_fields_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class PortfolioCardWidget extends StatelessWidget {
  const PortfolioCardWidget({
    Key? key, required this.label, required this.subtitleLabel, required this.rowsWithFields, required this.gradientColor, required this.cashoutPage, required this.detailsPage, required this.actionLabel,
  }) : super(key: key);

  final String label;
  final String subtitleLabel;
  final List<RowsWithFields> rowsWithFields;
  final Gradient gradientColor;
  final Widget cashoutPage;
  final Widget detailsPage;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    gradient: gradientColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(label.toUpperCase(), style: TextStyles.titles.copyWith(color: Colors.black, fontSize: 22)),
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(subtitleLabel),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: rowsWithFields,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => pushToPage(context, detailsPage),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                            gradient: TextStyles.gradientColorTopToBottom,
                          ),
                          child: Center(
                            child: Text('Detalhes', style: TextStyles.titles.copyWith(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => pushToPage(context, cashoutPage),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                            gradient: TextStyles.gradientColorTopToBottom,
                          ),
                          child: Center(
                            child: Text(actionLabel, style: TextStyles.titles.copyWith(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}