import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProvider extends ChangeNotifier {
  String selectedValue = 'stocks';
  final formKey = GlobalKey<FormState>();
  File? picked;
  final nameController = TextEditingController();
  final numController = TextEditingController();
  final sellingpriceController = TextEditingController();
  final costpriceController = TextEditingController();

  addvalue(newvalue) {
    selectedValue = newvalue!.toString();
    notifyListeners();
  }

  fromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    picked = File(returnedimage!.path);
    notifyListeners();
  }
}
