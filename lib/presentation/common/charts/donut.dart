import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/common/charts/palettes/salmon_pallete.dart';
import 'package:obenx_com_br_app/presentation/common/charts/palettes/violet_pallete.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool? animate;

  DonutPieChart(this.seriesList, {this.animate});

  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart<int>(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: 10),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 50, MaterialSalmon().shadeDefault),
      new LinearSales(1, 15, MaterialViolet().shadeDefault),
      new LinearSales(2, 35, charts.MaterialPalette.blue.shadeDefault),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, _) => sales.color,

        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;
  final charts.Color color;

  LinearSales(this.year, this.sales, this.color);
}