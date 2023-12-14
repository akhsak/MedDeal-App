// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({Key? key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  String selectedValue='Meaddeal';
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
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Opening Stock',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Reorder Stock',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Stall Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // DropdownButtonFormField(    
              //   decoration: InputDecoration(
              //     hintText: 'cateqory',
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              //   items: [
              //     DropdownMenuItem(
              //       value: "Meaddeal",
              //       child:Text('Medicines'),
              //        ),
              //        DropdownMenuItem(
              //       value: "Meaddeal",
              //       child:Text('Equipments'),
              //        ),
              //        DropdownMenuItem(
              //       value: "Meaddeal",
              //       child:Text('Machines'),
              //        ),
              //          DropdownMenuItem(
              //       value: "Meaddeal",
              //       child:Text('Others'),
              //        ),
              //   ],
              //  onChanged: (String? newValue){
              //   setState(() {
              //     selectedValue = newValue!;
              //   });
              //  }),
               
                DropdownButtonFormField <String>(
                          decoration: InputDecoration(
                            hintText: "Select Item",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                          ),
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Selling Price',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Cost Price',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
               ),
               SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
