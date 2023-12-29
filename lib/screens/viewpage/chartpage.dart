
import 'package:flutter/material.dart';
import 'package:stockapp/db/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: itemlistnotifier,
      builder: (BuildContext, List<ItemsModel> itemlist, Widget? child) {
       return SfCircularChart(
          title: ChartTitle(text: 'Stock items'),
          legend: const Legend(isVisible: true),
          series: <PieSeries<_PieData, String>>[
            PieSeries<_PieData, String>(
                explode: true,
                explodeIndex: 0,
                dataSource: pieData,
                xValueMapper: (_PieData data, _) => data.xData,
                yValueMapper: (_PieData data, _) => data.yData,
                dataLabelMapper: (_PieData data, _) => data.text,
                dataLabelSettings: const DataLabelSettings(isVisible: true)),
          ]);
      },
       
    );
  }
}

class _PieData {
  final String xData;
  final num yData;
  final String text;
  _PieData(this.xData, this.yData, this.text);
}

final List<_PieData> pieData = [
  _PieData('Medicine A', 30, '30%'),
  _PieData('Equipments B', 20, '20%'),
  _PieData('Saniters C', 15, '15%'),
  _PieData('Others D', 10, '10%'),
];
