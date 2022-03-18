import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/common/charts/donut.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class TypeOfInvestor extends StatelessWidget {
  const TypeOfInvestor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTypesOfInvestorWidget(),
        const SizedBox(height: 25),
        Stack(
          children: <Widget>[
            SizedBox(
              height: 190,
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text('Meus investimentos', style: TextStyles.subtitlePrimaryColor.copyWith(fontSize: 10),)
              ),
            ),
            SizedBox(height: 190.0, child: DonutPieChart.withSampleData()),
          ]
        ),
        const SizedBox(height: 15),
        Text('Performance da carreira', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class RowTypesOfInvestorWidget extends StatelessWidget {
  const RowTypesOfInvestorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(5),
                    color: Color(0XFF5ACFF9),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  'Conservador',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(5),
                    color: Color(0XFF696FBD),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  'Moderado',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(5),
                    color: Color(0XFFF57F7D),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  'Sofisticado',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}