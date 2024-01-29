import 'package:flutter/material.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/service/db_service.dart';

class DbProvider extends ChangeNotifier {
  List <ItemsModel> meddeal=[];
 // DbServices dbservice = DbServices();

  // Future getAllitems()async{
  //   meddeal = await dbservice.getAllitems(); 
  //   notifyListeners();
  // }

  // Future additems(ItemsModel value)async{
  //   meddeal= await dbservice.additems(value);
  //   getAllitems();

  // }

  // Future deleteitems(int index)async{
  //   meddeal=await dbservice.deleteitems(index);
  //   getAllitems();
  // }

  // Future edit(int id, ItemsModel value){

  // }
  // calculateTotalCost(List<ItemsModel> items) {
  //   double totalCost = 0;
  //   for (int i = 0; i < items.length; i++) {
  //     var itemm = items[i];
  //     totalCost += double.parse(itemm.costprice);
  //   }
  //   return totalCost;
  // }
}
