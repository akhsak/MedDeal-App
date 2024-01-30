// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/add_provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/view/widget/bottombar.dart';
import 'package:stockapp/view/widget/textformfield.dart';

class Addpage extends StatelessWidget {
  const Addpage({Key? key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    final pro = Provider.of<AddProvider>(context, listen: false);

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
            key: pro.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      pro.fromgallery();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 200,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: pro.picked != null
                            ? DecorationImage(
                                image: FileImage(pro.picked!),
                                fit: BoxFit.fill,
                              )
                            : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: pro.picked == null
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
                    controller: pro.namecontroller,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextForm(
                    labelText: 'stall number',
                    controller: pro.numcontroller,
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
                    pro.addvalue(newvalue);
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
                          controller: pro.sellingpricecontroller,
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
                          controller: pro.costpricecontroller,
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
                      if (pro.formKey.currentState!.validate()) {
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
    final pro = Provider.of<AddProvider>(context, listen: false);
    if (pro.formKey.currentState!.validate()) {
      final _name = pro.namecontroller.text.trim();
      final _num = pro.numcontroller.text.trim();
      final _item = pro.selectedValue;
      final _sellprice = pro.sellingpricecontroller.text.trim();
      final _costprice = pro.costpricecontroller.text.trim();

      final _addItem = ItemsModel(
        name: _name,
        numbr: _num,
        item: _item,
        sellprice: _sellprice,
        costprice: _costprice,
        image: pro.picked?.path ?? '',
      );
    Provider.of<DbProvider>(context,listen: false). additems(_addItem);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Bottombar()),
          (route) => false);
      pro.namecontroller.clear();
      pro.costpricecontroller.clear();
      pro.numcontroller.clear();
      pro.sellingpricecontroller.clear();
      pro.costpricecontroller.clear();
      pro.picked=null;
    }
  }
}
