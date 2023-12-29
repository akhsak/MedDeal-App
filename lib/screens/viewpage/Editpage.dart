// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/widget/bottomtabs/bottombar.dart';

class Editpage extends StatefulWidget {
  var name;
  var num;
  var items;
  var sellprice;
  var costprice;

  int index;
  dynamic imagePath;

  Editpage({
    required this.index,
    required this.name,
    required this.num,
    required this.items,
    required this.sellprice,
    required this.costprice,
    required this.imagePath,
  });

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numController = TextEditingController();
  TextEditingController _sellpriceController = TextEditingController();
  TextEditingController _costpriceController = TextEditingController();
  List dropdownItems = [];
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _numController = TextEditingController(text: widget.num);
    _sellpriceController = TextEditingController(text: widget.sellprice);
    _costpriceController = TextEditingController(text: widget.costprice);

    _selectedImage = widget.imagePath != '' ? File(widget.imagePath) : null;
    selectedValue = widget.items;
  }

  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
         title: Text('update',
            style: TextStyle(
                color: Color.fromRGBO(248, 248, 249, 1),
                fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(12, 2, 85, 1),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 150,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: _selectedImage == null
                          ? Icon(Icons.add_a_photo, color: Colors.grey)
                          : 
                           Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                height: 150,
                                width: 100,
                              ),
                            ),
                    ),
                  ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(color: Color.fromARGB(255, 93, 92, 94)),
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 134, 132, 136)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _numController,
                    style: TextStyle(color: Color.fromARGB(255, 125, 125, 125)),
                    decoration: InputDecoration(
                      labelText: 'Stall Number',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 30, 3, 56)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: "Select Item",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 30, 3, 56)),
                      border: OutlineInputBorder(),
                    ),
                    dropdownColor: Color.fromARGB(255, 111, 110, 112),
                    isExpanded: true,
                    onChanged: (String? newvalue) {
                      setState(() {
                        selectedValue = newvalue!.toString();
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: "Medicines",
                        child: Text(
                          "Medicines",
                          style:
                              TextStyle(color: Color.fromARGB(255, 19, 19, 19)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Equipments",
                        child: Text(
                          "Equipments",
                          style: TextStyle(color: Color.fromARGB(255, 7, 6, 6)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Sanitizers",
                        child: Text(
                          "Sanitizers",
                          style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Others",
                        child: Text(
                          "Others",
                          style:
                              TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _sellpriceController,
                          style:
                              TextStyle(color: Color.fromARGB(255, 30, 3, 56)),
                          decoration: InputDecoration(
                            labelText: 'Selling Price',
                            prefixText: '₹',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 30, 3, 56)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _costpriceController,
                          style:
                              TextStyle(color: Color.fromARGB(255, 30, 3, 56)),
                          decoration: InputDecoration(
                            labelText: 'Cost Price',
                            prefixText: '₹',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 30, 3, 56)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    updateall();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Bottombar()),
                        (route) => false);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateall() async {
    final name = _nameController.text.trim();
    final num = _numController.text.trim();
    final items = selectedValue;
    final sellprice = _sellpriceController.text.trim();
    final costprice = _costpriceController.text.trim();
    final image = _selectedImage?.path ?? '';

    if (name.isEmpty ||
        num.isEmpty ||
        items.isEmpty ||
        sellprice.isEmpty ||
        costprice.isEmpty ||
        image.isEmpty) {
      return;
    } else {
      final update = ItemsModel(
        name: name,
        num: num,
        item: items,
        sellprice: sellprice,
        costprice: costprice,
        image: image,
      );
      print(update);

      edit(widget.index, update);
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);

    if (returnImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }
}
