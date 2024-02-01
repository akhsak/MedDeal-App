// import 'package:flutter/material.dart';


// class CategoryProvider extends ChangeNotifier {
   
//   TextEditingController searchController = TextEditingController();

   
  
// }
// CategoryProvider.dart
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  void updateSearchQuery(String query) {
    searchQuery = query.toLowerCase();
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery = '';
    notifyListeners();
  }
}
