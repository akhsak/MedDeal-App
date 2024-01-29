import 'package:flutter/material.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';

class SearchProvider extends ChangeNotifier {
    List<ItemsModel> searcheditem = [];

  
  loaditem() async {
    final item = itemlistnotifier.value;
      searcheditem = item;
  }

 filter(String enteredName) {
    List<ItemsModel> result = [];

    if (enteredName.isEmpty) {
      result = itemlistnotifier.value;
    } else {
      result = itemlistnotifier.value
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