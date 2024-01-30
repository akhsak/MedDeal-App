import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProvider extends ChangeNotifier {


 // class _EditpageState extends State<Editpage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numController = TextEditingController();
  TextEditingController _sellpriceController = TextEditingController();
  TextEditingController _costpriceController = TextEditingController();

  List dropdownItems = [];
  File? picked;
  
  String selectedValue = '';

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