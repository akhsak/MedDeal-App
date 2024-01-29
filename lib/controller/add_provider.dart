import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProvider extends ChangeNotifier {
  String selectedValue = 'Meaddeal';
  final formKey = GlobalKey<FormState>();
  File? picked;
  final namecontroller = TextEditingController();
  final numcontroller = TextEditingController();
  final sellingpricecontroller = TextEditingController();
  final costpricecontroller = TextEditingController();

  

  addvalue(newvalue) {
      selectedValue = newvalue!.toString();
    notifyListeners();
  }

  
  fromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
      picked =File(returnedimage!.path);
      notifyListeners();
  }

}
