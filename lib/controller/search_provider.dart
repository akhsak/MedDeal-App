import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/model/data_model.dart';

class SearchProvider extends ChangeNotifier {
    List<ItemsModel> searcheditem = [];

  
  // loaditem() async {
  //   final item = itemlistnotifier.value;
  //     searcheditem = item;
  // }

 filter(context,String enteredName) {
  final getPrv= Provider.of<DbProvider>(context,listen: false);
    List<ItemsModel> result = [];

    if (enteredName.isEmpty) {
      result =getPrv.meddeal;
    } else {
      result = getPrv.meddeal
          .where(
            (ItemsModel items) =>
                items.name.toLowerCase().contains(enteredName.toLowerCase()) ||
                items.item.toLowerCase().contains(enteredName.toLowerCase()),
          )
          .toList();
    }

      searcheditem = result;
      notifyListeners();
  }
  
}