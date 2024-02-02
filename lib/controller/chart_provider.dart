import 'package:flutter/material.dart';
import 'package:stockapp/model/data_model.dart';

class ChartProvider extends ChangeNotifier {
  


  List<ItemsModel> _itemList = [];

  List<ItemsModel> get itemList => _itemList;

  set itemList(List<ItemsModel> newList) {
    _itemList = newList;
    notifyListeners();
  }

  List<_PieData> convertItemsToPieData() {
    Map<String, double> categoryCountMap = {};

    for (var itemm in _itemList) {
      if (categoryCountMap.containsKey(itemm.item)) {
        categoryCountMap[itemm.item] = categoryCountMap[itemm.item]! + 1;
      } else {
        categoryCountMap[itemm.item] = 1;
      }
    }

    List<_PieData> pieDataList = [];
    categoryCountMap.forEach((category, count) {
      pieDataList.add(_PieData(category, count, '$category: $count items'));
    });
    return pieDataList;
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}




