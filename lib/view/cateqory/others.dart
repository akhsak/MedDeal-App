// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/data_model.dart';
import 'package:stockapp/view/screen/details.dart';
import 'package:stockapp/view/screen/edit_page.dart';

class Otherspag extends StatefulWidget {
  const Otherspag({Key? key}) : super(key: key);

  @override
  State<Otherspag> createState() => _OtherspageState();
}

class _OtherspageState extends State<Otherspag> {
  TextEditingController searchController = TextEditingController();
  List<ItemsModel> itemList = [];

  @override
  Widget build(BuildContext context) {
  final pro=Provider.of<DbProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Others List'),
      ),
      body:Consumer<DbProvider>(
        builder: (context, value, child) 
        // valueListenable: itemlistnotifier,
        // builder:
        //     (BuildContext context, List<ItemsModel> Itemlist, Widget? child)
             {
          itemList = value.meddeal.where((items) => items.item
              .split(',')
              .map((category) => category.trim().toLowerCase())
              .contains('others')).toList();

          String searchQuery = searchController.text.toLowerCase();
          List<ItemsModel> filteredItemList = itemList;
          if (searchQuery.isNotEmpty) {
            filteredItemList = itemList.where((item) {
              return item.name.toLowerCase().contains(searchQuery);
              //||
                 // item.costprice.toUpperCase().contains(searchQuery);
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
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: filteredItemList.isEmpty
                    ? Lottie.asset(
                        "assets/Animation - 1704946991285.json",
                        width: 200,
                      )
                    : ListView.builder(
                        itemCount: filteredItemList.length,
                        itemBuilder: (context, index) {
                          final data = filteredItemList[index];
                          return Card(
                            color: Color.fromARGB(255, 241, 242, 243),
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
                                                title: Text(
                                                    'Are you sure want to delete'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('close')),
                                                  TextButton(
                                                      onPressed: () {
                                                        pro.deleteitems(index);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('delete'))
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

// class OthersSearchDelegate extends SearchDelegate {
//   final List<ItemsModel> itemList;

//   OthersSearchDelegate(this.itemList);

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return buildSearchResults();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return buildSearchResults();
//   }

//   Widget buildSearchResults() {
//     return ListView.builder(
//       itemCount: itemList.length,
//       itemBuilder: (context, index) {
//         final data = itemList[index];
//         return ListTile(
//           title: Text(data.name),
//           subtitle: Text(data.item),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Detailspage(
//                   name: data.name,
//                   num: data.numbr,
//                   item: data.item,
//                   sellprice: data.sellprice,
//                   costprice: data.costprice,
//                   image: data.image!,
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
 // }
//}
