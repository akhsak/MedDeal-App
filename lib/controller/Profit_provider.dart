import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/model/data_model.dart';

class ProfitProvider extends ChangeNotifier {
  late double profit;
  late double cost;
  double totalSpending = 0;
  double totalEarning = 0;

  Future<void> calculateTotalValues(context) async {
    double totalCost = 0;
    double totalSelling = 0;

    for (ItemsModel item in Provider.of<DbProvider>(context,listen: false).meddeal) {
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
