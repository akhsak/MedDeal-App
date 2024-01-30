// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/controller/search_provider.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/view/screen/details.dart';
import 'package:stockapp/view/screen/edit_page.dart';

class Searchitemss extends StatelessWidget {
  Searchitemss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SearchProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 90, 152),
        title: Center(
          child: Text(
            'Search items',
            style: TextStyle(color: Color.fromARGB(255, 244, 245, 247)),
            
          ),
          
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                onChanged: (value) => pro.filter(value),
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
            Consumer<SearchProvider>(builder: (context, value, child) {
              return Expanded(
                child: value.searcheditem.isEmpty
                    ? Lottie.asset(
                        "assets/Animation - 1704946991285.json",
                        width: 200,
                      )
                    : ListView.builder(
                        itemCount: value.searcheditem.length,
                        itemBuilder: (context, index) {
                          final data = value.searcheditem[index];
                          return Card(
                            color: Color.fromARGB(255, 246, 246, 246),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailspage(
                                      name: data.name,
                                      num: data.numbr,
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
                                            id: index,
                                            items: data.item,
                                            name: data.name,
                                            numbr: data.numbr,
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
              );
            }),
          ],
        ),
      ),
    );
  }
}
