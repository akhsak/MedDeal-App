import 'package:flutter/material.dart';
import 'package:stockapp/model/data_model.dart';
import 'package:stockapp/service/db_service.dart';

class DbProvider extends ChangeNotifier {
  List <ItemsModel> meddeal=[];
  DbServices dbservice = DbServices();

  Future getAllitems()async{
    meddeal = await dbservice.getAllitems(); 
    notifyListeners();
  }

  Future additems(ItemsModel value)async{
     await dbservice.additems(value);
    getAllitems();
   notifyListeners();
  }

  Future deleteitems(int index)async{
   await dbservice.deleteitems(index);
    getAllitems();
  }

 Future edit(int index, ItemsModel value)async{
 await dbservice.edit(index, value);
 getAllitems();

  }

  Future deleteAllitems()async{
await dbservice.deleteAllitems();
 getAllitems();
  }


  calculateTotalCost(List<ItemsModel> items) {
  double totalCost = 0;
  for (int i = 0; i < items.length; i++) {
    var itemm = items[i];
    totalCost += double.parse(itemm.costprice);
  }
  return totalCost;
}


}
