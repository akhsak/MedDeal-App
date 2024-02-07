import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  String search = '';

  void updateSearch(String query) {
    search = query.toLowerCase();
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    search = '';
    notifyListeners();
  }
}
