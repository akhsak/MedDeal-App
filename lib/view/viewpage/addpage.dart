// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockapp/controller/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/widget/bottomtabs/bottombar.dart';
import 'package:stockapp/widget/textformfield.dart';

class Addpage extends StatefulWidget {
  const Addpage({Key? key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  String selectedValue = 'Meaddeal';

  final _namecontroller = TextEditingController();
  final _numcontroller = TextEditingController();
  final _sellingpricecontroller = TextEditingController();
  final _costpricecontroller = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  final ImagePicker imagePicker = ImagePicker();
  File? picked;

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
        title: Text('Add Items',
            style: TextStyle(
                color: Color.fromRGBO(248, 248, 249, 1),
                fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(12, 2, 85, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => getimage(ImageSource.gallery),
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
                      child: picked == null
                          ? Icon(Icons.add_a_photo)
                          : Image.file(
                              picked!,
                              fit: BoxFit.cover,
                              height: 150,
                              width: 100,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextForm(
                      labelText: 'Item name', controller: _namecontroller),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextForm(
                      labelText: 'stall number', controller: _numcontroller),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      hintText: "Select Item", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is Empty';
                    } else {
                      return null;
                    }
                  },
                  dropdownColor: const Color.fromARGB(255, 208, 203, 203),
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
                      value: "Saniters",
                      child: Text(
                        "Saniters",
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
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: CustomTextForm(
                          labelText: 'selling price',
                          controller: _sellingpricecontroller,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          prefixText: '₹',
                          keyboard: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: CustomTextForm(
                          labelText: 'Cost price',
                          controller: _costpricecontroller,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          prefixText: '₹',
                           keyboard: TextInputType.number,

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: Text('Please fill in all the fields'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onAddItemButtonClicked();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bottombar()),
                            (route) => false);
                      }
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddItemButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _num = _numcontroller.text.trim();
    final _item = selectedValue;
    final _sellprice = _sellingpricecontroller.text.trim();
    final _costprice = _costpricecontroller.text.trim();

    if (_formKey.currentState?.validate() ?? false) {
      final _addItem = ItemsModel(
          name: _name,
          num: _num,
          item: _item,
          sellprice: _sellprice,
          costprice: _costprice,
          image: picked?.path ?? '');
      additems(_addItem);

      Navigator.pop(context);
    } else {
      setState(() {
        _isDataMatched = false;
      });
    }
  }

  getimage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }
}
