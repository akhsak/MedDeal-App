import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController sellpriceController = TextEditingController();
  TextEditingController costpriceController = TextEditingController();

  List dropdownItems = [];
  File? picked;

  String selectedValue = '';

  void addvalue(newvalue) {
    selectedValue = newvalue!.toString();
    notifyListeners();
  }

  imagefromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    picked = File(returnedimage!.path);
    notifyListeners();
  }
}
