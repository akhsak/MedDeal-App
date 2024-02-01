// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, must_be_immutable, use_key_in_widget_constructors, unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/controller/edit_provider.dart';
import 'package:stockapp/model/data_model.dart';
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


  @override
  void initState() {
    super.initState();
    final pro = Provider.of<EditProvider>(context, listen: false);
    pro.nameController = TextEditingController(text: widget.name);
    pro.numController = TextEditingController(text: widget.numbr);
    pro.sellpriceController = TextEditingController(text: widget.sellprice);
    pro.costpriceController = TextEditingController(text: widget.costprice);

    pro.picked = widget.imagePath != '' ? File(widget.imagePath) : null;
    pro.selectedValue = widget.items;
  }

 // String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    final editProvider = Provider.of<EditProvider>(context, listen: false);

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
                      Provider.of<EditProvider>(context, listen: false)
                          .fromgallery();
                    },
                    child: Consumer<EditProvider>(
                        builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 200,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          image: value.picked != null
                              ? DecorationImage(
                                  image: FileImage(value.picked!),
                                  fit: BoxFit.fill,
                                )
                              : null,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: value.picked == null
                            ? Center(
                                child: Lottie.asset(
                                    'assets/Animation - addimage.json'))
                            : null,
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextForm(
                    labelText: 'itemname',
                    controller: editProvider.nameController,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextForm(
                    labelText: 'stall number',
                    controller: editProvider.numController,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<EditProvider>(builder: (context, value, child) => 
                     DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Select Item",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 30, 3, 56)),
                        border: OutlineInputBorder(),
                      ),
                      dropdownColor: Color.fromARGB(255, 111, 110, 112),
                      isExpanded: true,
                      onChanged: (String? newvalue) {
                        value.addvalue(newvalue);
                        // setState(() {
                        //   selectedValue = newvalue!.toString();
                        // });
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
                          value: "Sanitizer",
                          child: Text(
                            "Sanitizer",
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
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextForm(
                          labelText: 'selling price',
                          controller: editProvider.sellpriceController,
                          prefixText: '₹',
                          keyboard: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomTextForm(
                          labelText: 'cost price',
                          controller: editProvider.costpriceController,
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
    final pro = Provider.of<EditProvider>(context, listen: false);
    final name = pro.nameController.text.trim();
    final num = pro.numController.text.trim();
    final items = pro.selectedValue;
    final sellprice = pro.sellpriceController.text.trim();
    final costprice = pro.costpriceController.text.trim();
    final image = pro.picked?.path ?? '';

    if (name.isEmpty ||
        num.isEmpty ||
        items.isEmpty ||
        sellprice.isEmpty ||
        costprice.isEmpty) {
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

      Provider.of<DbProvider>(context, listen: false).edit(update.id!, update);
      Navigator.of(context).pop();
    }
  }

  // fromGallery() async {
  //   final returnImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (returnImage == null) {
  //     return;
  //   }

  // setState(() {
  //   picked = File(returnImage.path);
  // });
//  }
}
