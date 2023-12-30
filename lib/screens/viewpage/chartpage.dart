
// import 'package:flutter/material.dart';
// import 'package:stockapp/function/functions/db_function.dart';
// import 'package:stockapp/model/datamodel.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class PieChart extends StatelessWidget {
//   const PieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: itemlistnotifier,
//       builder: (BuildContext, List<ItemsModel> itemlist, Widget? child) {
        
//        return SfCircularChart(
//           title: ChartTitle(text: 'Stock items'),
//           legend: const Legend(isVisible: true),
//           series: <PieSeries<_PieData, String>>[
//             PieSeries<_PieData, String>(
//                 explode: true,
//                 explodeIndex: 0,
//                 dataSource: pieData,
//                 xValueMapper: (_PieData data, _) => data.xData,
//                 yValueMapper: (_PieData data, _) => data.yData,
//                 dataLabelMapper: (_PieData data, _) => data.text,
//                 dataLabelSettings: const DataLabelSettings(isVisible: true)),
//           ]);
//       },
       
//     );
//   }
// }

// class _PieData {
//   final String xData;
//   final num  yData;
//   final String text;
//   _PieData(this.xData, this.yData, this.text);
// }

// final List<_PieData> pieData = [
//   _PieData('Medicine A',30, '30%'),
//   _PieData('Equipments B', 20, '20%'),
//   _PieData('Saniters C', 15, '15%'),
//   _PieData('Others D', 10, '10%'),
// ];
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