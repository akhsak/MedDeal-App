import 'package:flutter/material.dart';
import 'package:stockapp/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';

class ProfitProvider extends ChangeNotifier {
  late double profit;
  late double cost;
  double totalSpending = 0;
  double totalEarning = 0;

  Future<void> calculateTotalValues() async {
    double totalCost = 0;
    double totalSelling = 0;

    for (ItemsModel item in itemlistnotifier.value) {
      totalCost += double.parse(item.costprice);
      totalSelling += double.parse(item.sellprice);
    }

    totalEarning = totalSelling;
    totalSpending = totalCost;
    profit = totalEarning - totalSpending;
    cost = totalEarning;
    notifyListeners();
  }
}
