
// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, must_be_immutable, use_key_in_widget_constructors, unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/view/widget/bottombar.dart';
import 'package:stockapp/view/widget/textformfield.dart';

class Editpage extends StatefulWidget {
  var name;
  var numbr;
  var items;
  var sellprice;
  var costprice;
  int id;
  dynamic imagePath;

  Editpage({
    required this.id,
    required this.name,
    required this.numbr,
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
  File? picked;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _numController = TextEditingController(text: widget.numbr);
    _sellpriceController = TextEditingController(text: widget.sellprice);
    _costpriceController = TextEditingController(text: widget.costprice);

    picked = widget.imagePath != '' ? File(widget.imagePath) : null;
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
        title: Text(
          'update',
          style: TextStyle(
            color: Color.fromRGBO(248, 248, 249, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 43, 90, 152),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      fromGallery();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 200,
                      width: screenWidth,
                      decoration: BoxDecoration(
                           image: picked != null
                              ? DecorationImage(
                                  image: FileImage(picked!),
                                  fit: BoxFit.fill,
                                )
                              : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: picked == null
                          ? Center(
                              child: Lottie.asset(
                                  'assets/Animation - addimage.json'))
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextForm(
                    labelText: 'itemname',
                    controller: _nameController,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextForm(
                    labelText: 'stall number',
                    controller: _numController,
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
                        child: CustomTextForm(
                          labelText: 'selling price',
                          controller: _sellpriceController,
                          prefixText: '₹',
                          keyboard: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomTextForm(
                          labelText: 'cost price',
                          controller: _costpriceController,
                          keyboard: TextInputType.number,
                          prefixText: '₹',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    updateAll();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Bottombar()),
                      (route) => false,
                    );
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

  Future<void> updateAll() async {
    final name = _nameController.text.trim();
    final num = _numController.text.trim();
    final items = selectedValue;
    final sellprice = _sellpriceController.text.trim();
    final costprice = _costpriceController.text.trim();
    final image = picked?.path ?? '';

    if (name.isEmpty ||
        num.isEmpty ||
        items.isEmpty ||
        sellprice.isEmpty ||
        costprice.isEmpty ||
        image.isEmpty) {
      return;
    } else {
      final update = ItemsModel(
        id: widget.id,
        name: name,
        numbr: num,
        item: items,
        sellprice: sellprice,
        costprice: costprice,
        image: image,
      );

      edit(widget.id, update);
      Navigator.of(context).pop();
    }
  }

  fromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    setState(() {
      picked = File(returnImage.path);
    });
  }
}
