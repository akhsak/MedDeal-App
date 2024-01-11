// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stockapp/controller/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/view/viewpage/details.dart';
import 'package:stockapp/view/viewpage/editpage.dart';

class Saniterspage extends StatefulWidget {
  const Saniterspage({Key? key}) : super(key: key);

  @override
  State<Saniterspage> createState() => _SaniterspageState();
}

class _SaniterspageState extends State<Saniterspage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saniters List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: itemlistnotifier,
        builder:
            (BuildContext context, List<ItemsModel> Itemlist, Widget? child) {
          List<ItemsModel> filteredItemList =
              Itemlist.where((items) => items.item.toLowerCase() == 'saniters')
                  .toList();

          String searchQuery = searchController.text.toLowerCase();
          if (searchQuery.isNotEmpty) {
            filteredItemList = filteredItemList.where((item) {
              return item.name.toLowerCase().contains(searchQuery) ||
                  item.costprice.toUpperCase().contains(searchQuery);
            }).toList();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: filteredItemList.isEmpty
                    ? Center(
                        child: Lottie.asset(
                          "assets/Animation - 1704946991285.json",
                          width: 200,
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredItemList.length,
                        itemBuilder: (context, index) {
                          final data = filteredItemList[index];
                          return Card(
                            color: const Color.fromARGB(255, 241, 242, 243),
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
                                  Text(data.numbr),
                                  Text(data.item),
                                  Text(data.sellprice),
                                  Text(data.costprice),
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
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Are you sure want to delete'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('close')),
                                                  TextButton(
                                                      onPressed: () {
                                                        deleteitems(index);
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('delete'))
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: Colors.black),
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
          );
        },
      ),
    );
  }
}
