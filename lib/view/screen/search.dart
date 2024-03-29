// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/controller/search_provider.dart';
import 'package:stockapp/view/screen/details.dart';

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
                onChanged: (value) => pro.filter(context, value),
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
                            color: Color.fromARGB(255, 80, 131, 199),
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
                              title: Text(data.name,style: TextStyle(color: Colors.white)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.item,style:TextStyle(color: Colors.white,fontSize: 10),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                                                    Provider.of<DbProvider>(
                                                            context,
                                                            listen: false)
                                                        .deleteitems(index);
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
                                      color: Color.fromARGB(255, 176, 79, 72),
                                    ),
                                  ]),
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
