import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stockapp/model/datamodel.dart';

ValueNotifier<List<ItemsModel>> itemlistnotifier = ValueNotifier([]);

void additems(ItemsModel value) async {
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  await itemsDB.add(value);
  itemlistnotifier.value.add(value);
  itemlistnotifier.notifyListeners();

}

Future<void> getAllitems() async {
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  itemlistnotifier.value.clear();

  itemlistnotifier.value.addAll(itemsDB.values);
  itemlistnotifier.notifyListeners();
}

Future<void>edit(int index,ItemsModel value)async{
 final itemsDB= await Hive.openBox<ItemsModel>('items_db');
 itemlistnotifier.value.clear();
 itemlistnotifier.value.addAll(itemsDB.values);
  itemlistnotifier.notifyListeners();
  itemsDB.putAt(index, value);
  getAllitems();


}
Future<void> deleteitems(int id) async{
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  itemsDB.deleteAt(id);
  getAllitems();
}


double calculateTotalCost(List<ItemsModel> foods) {
  double totalCost = 0;
  for (var food in foods) {
    totalCost += double.parse(food.costprice);
  }
  return totalCost;
}
Future<void> deleteAllitems() async{
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
   await itemsDB.clear();
  getAllitems();
}
