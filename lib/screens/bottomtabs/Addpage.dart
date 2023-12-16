// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:stockapp/db/functions/db_function.dart';
import 'package:stockapp/db/model/datamodel.dart';
import 'package:stockapp/screens/bottomtabs/homepage.dart';

class Addpage extends StatefulWidget {
  const Addpage({Key? key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  String selectedValue='Meaddeal';
  final _namecontroller=TextEditingController();
  final _numcontroller=TextEditingController();
  final _itemcontroller=TextEditingController();
  final _pricecontroller=TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo, size: 50),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    controller:_namecontroller ,
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                      border: OutlineInputBorder(),
                    ),
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter itemname';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _itemcontroller,
                          decoration: InputDecoration(
                            labelText: 'Opening Stock',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return 'enter openstock' ;
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _pricecontroller,
                          decoration: InputDecoration(
                            labelText: 'Reorder Stock',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value==null ||value.isEmpty){
                            return 'enter reorder stock';
                            }else{
                              return null;
                            }
                          }
                          ,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    controller: _numcontroller,
                    decoration: InputDecoration(
                      labelText: 'Stall Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'value is empty';                       
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),              
                  DropdownButtonFormField <String>(
                            decoration: InputDecoration(
                              hintText: "Select Item",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                            ),
                             validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'value is empty';                       
                      }else{
                        return null;
                      }
                    },
                            dropdownColor: const Color.fromARGB(255, 208, 203, 203),
                            borderRadius: BorderRadius.circular(30),
                            isExpanded: true,
                            onChanged: (String? newvalue) {
                              setState(() {
                                selectedValue = newvalue.toString();
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "Medicines",
                                child:Text("Medicines",style: TextStyle(
                                  color: Color.fromARGB(255, 19, 19, 19)
                                ),)),
                              DropdownMenuItem(                                     
                                value: "Equipments",
                                child:Text("Equipments",style: TextStyle(color: Color.fromARGB(255, 7, 6, 6)),)),
                                 DropdownMenuItem(
                                value: "saniters",
                                child:Text("saniters",style: TextStyle(
                                  color: Color.fromARGB(255, 8, 8, 8)
                                ),)),
                              DropdownMenuItem(
                                value: "others",
                                child:Text("others",style: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),)),
                            ],
                          ),
            
                 SizedBox(height: 20),
                 Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Selling Price',
                            border: OutlineInputBorder(),
                          ),
                           validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'value is empty';                       
                      }else{
                        return null;
                      }
                    },
                        ),
                        
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Cost Price',
                            border: OutlineInputBorder(),
                          ),
                           validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'value is empty';                       
                      }else{
                        return null;
                      }
                    },
                        ),
                      ),
                    ),
                  ],
                 ),
                 SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      onadditembuttonclicked();
                   //   Navigator.push(context, MaterialPageRoute(builder:(context)=>Homepage()));
                      
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
  Future<void>onadditembuttonclicked()async{
    final _name=_namecontroller.text.trim();
    final _num=_numcontroller.text.trim();
    final _item=_numcontroller.text.trim();
    final _price=_numcontroller.text.trim();


   if(_name.isEmpty || _num.isEmpty ||_item.isEmpty || _price.isEmpty){
    return;
   }
    print('$_name $_num  $_item $_price');
   final _additem= Items(name: _name, num: _num, item: _item, price: _price);
    additems(_additem);
  }
}
