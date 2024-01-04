// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stockapp/controller/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/view/viewpage/details.dart';
import 'package:stockapp/view/viewpage/editpage.dart';

class Medicinepage extends StatefulWidget {
  const Medicinepage({Key? key}) : super(key: key);

  @override
  State<Medicinepage> createState() => _MedicinepageState();
}

class _MedicinepageState extends State<Medicinepage> {
  TextEditingController searchController = TextEditingController();
  List<ItemsModel> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: itemlistnotifier,
        builder:
            (BuildContext context, List<ItemsModel> itemlist, Widget? child) {
          itemList = itemlist
              .where((items) => items.item.toLowerCase().contains('medicine'))
              .toList();

          String searchQuery = searchController.text.toLowerCase();
          List<ItemsModel> filteredItemList = itemList;
          if (searchQuery.isNotEmpty) {
            filteredItemList = itemList.where((item) {
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
                          "assets/dctrrrr.json",
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
                                  Text(data.num),
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
                                            num: data.num,
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
