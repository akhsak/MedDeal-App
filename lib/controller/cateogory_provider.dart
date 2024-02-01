import 'package:flutter/material.dart';
import 'package:stockapp/model/data_model.dart';

class CategoryProvider extends ChangeNotifier {
   
   
  TextEditingController searchController = TextEditingController();

  List<ItemsModel> get filteredItems => [];

  void searchvalue(){

  }

  void clearSearch() {

  }

  void filterItems(String value) {
    
  }
  
}