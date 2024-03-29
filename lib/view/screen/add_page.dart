// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/add_provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/data_model.dart';
import 'package:stockapp/view/widget/bottom_bar.dart';
import 'package:stockapp/view/widget/textform_field.dart';

class Addpage extends StatelessWidget {
  const Addpage({Key? key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    final addprovider = Provider.of<AddProvider>(context, listen: false);

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
        backgroundColor:  Color.fromARGB(255, 43, 90, 152),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: addprovider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      addprovider.fromgallery();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 200,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: addprovider.picked != null
                            ? DecorationImage(
                                image: FileImage(addprovider.picked!),
                                fit: BoxFit.fill,
                              )
                            : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: addprovider.picked == null
                          ? Center(
                              child: Lottie.asset(
                                  'assets/Animation - addimage.json'))
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextForm(
                    labelText: 'Item name',
                    controller: addprovider.nameController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextForm(
                    labelText: 'stall number',
                    controller: addprovider.numController,
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Select Item",
                    border: OutlineInputBorder(),
                  ),
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
                    addprovider.addvalue(newvalue);
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
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: CustomTextForm(
                          labelText: 'selling price',
                          controller: addprovider.sellingpriceController,
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
                          controller: addprovider.costpriceController,
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (addprovider.formKey.currentState!.validate()) {
                        onAddItemButtonClicked(context);
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

  Future<void> onAddItemButtonClicked(context) async {
    final addprovider = Provider.of<AddProvider>(context, listen: false);
    if (addprovider.formKey.currentState!.validate()) {
      final _name = addprovider.nameController.text.trim();
      final _num = addprovider.numController.text.trim();
      final _item = addprovider.selectedValue;
      final _sellprice = addprovider.sellingpriceController.text.trim();
      final _costprice = addprovider.costpriceController.text.trim();

      final _addItem = ItemsModel(
        name: _name,
        numbr: _num,
        item: _item,
        sellprice: _sellprice,
        costprice: _costprice,
        image: addprovider.picked?.path ?? '',
      );
    Provider.of<DbProvider>(context,listen: false). additems(_addItem);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Bottombar()),
          (route) => false);
      addprovider.nameController.clear();
      addprovider.costpriceController.clear();
      addprovider.numController.clear();
      addprovider.sellingpriceController.clear();
      addprovider.costpriceController.clear();
      addprovider.picked=null;
    }
  }
}
