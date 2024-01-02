import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/screens/viewpage/details.dart';
import 'package:stockapp/screens/viewpage/editpage.dart';

class SearchPatient extends StatefulWidget {
  SearchPatient({Key? key}) : super(key: key);

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  final String defaultImage = 'assets/download.png';

  List<ItemsModel> _searchedPatient = [];

  loadFood() async {
    final item = itemlistnotifier.value;
    setState(() {
      _searchedPatient = item;
    });
  }

  _filter(String enteredName) {
    List<ItemsModel> result = [];

    if (enteredName.isEmpty) {
      result = itemlistnotifier.value;
    } else {
      result = itemlistnotifier.value
          .where((ItemsModel patient) =>
              patient.name.toLowerCase().contains(enteredName.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchedPatient = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     // image: DecorationImage(
        //     //     image: AssetImage('assets/download.png'), fit: BoxFit.cover)
        //     ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                onChanged: (value) => _filter(value),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 16, 105, 140),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.search_sharp,
                    color: Color.fromARGB(255, 16, 105, 140),
                  ),
                  hintText: "Find  items...",
                  hintStyle: const TextStyle(
                    color: Color(0xFF636262),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: _searchedPatient.isEmpty
                  ? Center(
                      child: Image(image: AssetImage('assets/download.png')),
                    )
                  : ListView.builder(
                      itemCount: _searchedPatient.length,
                      itemBuilder: (context, index) {
                        final data = _searchedPatient[index];
                        return Card(
                          color: Color.fromARGB(255, 246, 246, 246),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailspage(
                                    name: data.name,
                                    num: data.num,
                                    item: data.item,
                                    sellprice: data.sellprice,
                                    costprice: data.costprice,
                                    image: data.image!,
                                  ),
                                ),
                              );
                            },
                            title: Text(data.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.item),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Editpage(
                                          costprice: data.costprice,
                                          index: index,
                                          items: data.item,
                                          name: data.name,
                                          num: data.num,
                                          sellprice: data.sellprice,
                                          imagePath: data.image!,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Are you sure want to delete'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('close'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deleteitems(index);
                                                Navigator.pop(context);
                                              },
                                              child: Text('delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundImage: FileImage(File(data.image!)),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
