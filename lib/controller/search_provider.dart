import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/data_model.dart';

class SearchProvider extends ChangeNotifier {
  List<ItemsModel> searcheditem = [];

  filter(context, String enteredName) {
    final searchprovider = Provider.of<DbProvider>(context, listen: false);
    List<ItemsModel> result = [];

    if (enteredName.isEmpty) {
      result = searchprovider.meddeal;
    } else {
      result = searchprovider.meddeal
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
