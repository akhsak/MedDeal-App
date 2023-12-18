import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stockapp/db/model/datamodel.dart';

ValueNotifier<List<ItemsModel>> itemlistnotifier = ValueNotifier([]);

void additems(ItemsModel value) async {
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  final _id=await itemsDB.add(value);
  value.id=_id;
  itemlistnotifier.value.add(value);
  itemlistnotifier.notifyListeners();

  //print(value.toString());
}

Future<void> getAllitems() async {
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  itemlistnotifier.value.clear();

  itemlistnotifier.value.addAll(itemsDB.values);
  itemlistnotifier.notifyListeners();
}
Future<void> deleteitems(int id) async{
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  itemsDB.deleteAt(id);
  getAllitems();
}