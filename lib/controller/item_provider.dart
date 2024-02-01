// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stockapp/model/itemsmodel.dart';
import 'package:stockapp/view/category/category_page.dart';

class ItemsProvider extends ChangeNotifier {
  List<CategoryData> categories = [
  CategoryData('Medicine', Icons.electrical_services,
        Color.fromARGB(255, 237, 236, 234), Categorypage(category: "Medicine",)),
     CategoryData('Equipments', Icons.electrical_services,
        Color.fromARGB(255, 237, 236, 234), Categorypage(category: "Equipments",)),
     CategoryData('Sanitizer', Icons.electrical_services,
        Color.fromARGB(255, 237, 236, 234), Categorypage(category: "Sanitizer",)),
     CategoryData('Others', Icons.electrical_services,
        Color.fromARGB(255, 237, 236, 234), Categorypage(category: "Otherspag",)),
  ];

  


 }
