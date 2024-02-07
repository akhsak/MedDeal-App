
// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/data_model.dart';
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
            series: <PieSeries<PieData, String>>[
              PieSeries<PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: convertItemsToPieData(Provider.of<DbProvider>(context,listen: false).meddeal),
                  xValueMapper: (PieData data, _) => data.xData,
                  yValueMapper: (PieData data, _) => data.yData,
                  dataLabelMapper: (PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]),
      ),
    );
  }
}


class PieData {
  PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

List<PieData> convertItemsToPieData(List<ItemsModel> itemlistnotifier) {
  Map<String, double> categoryCountMap = {};

  for (var itemm in itemlistnotifier) {
    if (categoryCountMap.containsKey(itemm.item)) {
      categoryCountMap[itemm.item] = categoryCountMap[itemm.item]! + 1;
    } else {
      categoryCountMap[itemm.item] = 1;
    }
  }

  List<PieData> pieDataList = [];
  categoryCountMap.forEach((category, count) {
    pieDataList.add(PieData(category, count, '$category: $count items'));
  });
return pieDataList;
}