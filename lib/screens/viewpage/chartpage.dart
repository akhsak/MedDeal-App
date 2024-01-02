
// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCircularChart(
            title: ChartTitle(
              text: 'Analyser',
            ),
            legend: const Legend(isVisible: true),
            series: <PieSeries<_PieData, String>>[
              PieSeries<_PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: convertItemsToPieData(itemlistnotifier.value),
                  xValueMapper: (_PieData data, _) => data.xData,
                  yValueMapper: (_PieData data, _) => data.yData,
                  dataLabelMapper: (_PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

List<_PieData> convertItemsToPieData(List<ItemsModel> itemlistnotifier) {
  Map<String, double> categoryCountMap = {};

  for (var item in itemlistnotifier) {
    if (categoryCountMap.containsKey(item.item)) {
      categoryCountMap[item.item] = categoryCountMap[item.item]! + 1;
    } else {
      categoryCountMap[item.item] = 1;
    }
  }

  List<_PieData> pieDataList = [];
  categoryCountMap.forEach((category, count) {
    pieDataList.add(_PieData(category, count, '$category: $count items'));
  });
return pieDataList;
}