import 'package:flutter/material.dart';
import 'package:stockapp/model/itemsmodel.dart';
import 'package:stockapp/view/cateqory/equipments.dart';
import 'package:stockapp/view/cateqory/medicine.dart';
import 'package:stockapp/view/cateqory/others.dart';
import 'package:stockapp/view/cateqory/saniters.dart';

class ItemsProvider extends ChangeNotifier {

  List<CategoryData> categories = [
    const CategoryData('Medicine', Icons.medical_services_outlined,
        Color.fromARGB(255, 230, 229, 228), Medicinepage()),
     CategoryData('Equipments', Icons.electrical_services,
        Color.fromARGB(255, 237, 236, 234), Categorypage(category: 'Equipments',)),
    const CategoryData('Saniters', Icons.equalizer_sharp,
        Color.fromARGB(255, 233, 235, 233), Saniterspage()),
    const CategoryData(
        'others', Icons.abc, Color.fromARGB(255, 245, 247, 248), Otherspag())
  ];
  
}
