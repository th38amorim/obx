// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Timeseries chart example
// EXCLUDE_FROM_GALLERY_DOCS_START
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/common/charts/palettes/primary_color_pallete.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate = false});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 50),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 75),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 125),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 10),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => PrimaryColorViolet().shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
