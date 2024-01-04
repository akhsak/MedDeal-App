// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

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

Future<void>edit(int id,ItemsModel value)async{
 final itemsDB= await Hive.openBox<ItemsModel>('items_db');
 itemlistnotifier.value.clear();
 itemlistnotifier.value.addAll(itemsDB.values);
  itemlistnotifier.notifyListeners();
  itemsDB.putAt(id, value);
  getAllitems();


}
Future<void> deleteitems(int id) async{
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  itemsDB.deleteAt(id);
  getAllitems();
}


 calculateTotalCost(List<ItemsModel> items) {
  double totalCost = 0;
  for (var itemm in items) {
    totalCost += double.parse(itemm.costprice);
  }
  return totalCost;
  
}
Future<void> deleteAllitems() async{
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
   await itemsDB.clear();
  getAllitems();
}


