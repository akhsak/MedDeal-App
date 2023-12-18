import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stockapp/db/model/datamodel.dart';

ValueNotifier<List<ItemsModel>>itemlistnotifier=ValueNotifier([]);


void additems(ItemsModel value)async{
 // itemlistnotifier.notifyListeners();
 final itemsDB=await Hive.openBox<ItemsModel>('items_db');
 itemsDB.add(value);
  itemlistnotifier.value.add(value);

  //print(value.toString());
}
Future<void>getAllitems()async{
   final itemsDB=await Hive.openBox<ItemsModel>('items_db');
    itemlistnotifier.value.clear();
     itemlistnotifier.value.addAll(itemsDB.values);




}