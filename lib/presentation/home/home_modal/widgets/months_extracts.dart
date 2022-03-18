import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/common/charts/points.dart';

class MonthsExtracts extends StatelessWidget {
  const MonthsExtracts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
                ),
              );
            },
          ),
        ),
        Column(
            children: <Widget>[
              SizedBox(height: 190.0, child: SimpleTimeSeriesChart.withSampleData()),
            ]
        ),
        const SizedBox(height: 15),
        Text('Posição consolidada', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}