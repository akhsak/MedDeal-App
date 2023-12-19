import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockapp/db/functions/db_function.dart';
import 'package:stockapp/db/model/datamodel.dart';
import 'package:stockapp/screens/bottomtabs/homepage.dart';

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
  TextEditingController _itemsController = TextEditingController();
  TextEditingController _sellpriceController = TextEditingController();
  TextEditingController _costpriceController = TextEditingController();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _numController = TextEditingController(text: widget.num);
    _itemsController = TextEditingController(text: widget.items);
    _sellpriceController = TextEditingController(text: widget.sellprice);
    _costpriceController = TextEditingController(text: widget.costprice);

    _selectedImage = widget.imagePath != '' ? File(widget.imagePath) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/download.png'), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : const AssetImage("assets/download.png")
                          as ImageProvider,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY")),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("CAMERA")),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: "itemName",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _numController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: '',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _itemsController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Medicine',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        maxLength: 10,
                        controller: _sellpriceController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Age',
                        ),
                      ),
                      TextField(
                        maxLength: 10,
                        controller: _costpriceController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Age',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue),
                          onPressed: () {
                            setState(() {
                              updateall();
                            });
                          },
                          icon: const Icon(Icons.done),
                          label: const Text("Update")),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateall() async {
    final name = _nameController.text.trim();
    final num = _numController.text.trim();
    final items = _itemsController.text.trim();
    final sellprice = _sellpriceController.text.trim();
    final costprice = _costpriceController.text.trim();
    final image = _selectedImage!.path;

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
          image: image);
      print(update);

      edit(widget.index, update);
      Navigator.of(context).pop();
    }
  }

  Future _pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);

    if (returnImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }
}
