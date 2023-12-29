import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/screens/viewpage/Editpage.dart';
import 'package:stockapp/screens/viewpage/details.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Others List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: itemlistnotifier,
        builder:
            (BuildContext context, List<ItemsModel> Itemlist, Widget? child) {
          itemList = Itemlist.where((food) => food.item
              .split(',')
              .map((category) => category.trim().toLowerCase())
              .contains('others')).toList();

          String searchQuery = searchController.text.toLowerCase();
          List<ItemsModel> filteredItemList = itemList;
          if (searchQuery.isNotEmpty) {
            filteredItemList = itemList.where((item) {
              return item.name.toLowerCase().contains(searchQuery) ||
                  item.num.toLowerCase().contains(searchQuery) ||
                  item.item.toLowerCase().contains(searchQuery) ||
                  item.sellprice.toLowerCase().contains(searchQuery) ||
                  item.costprice.toLowerCase().contains(searchQuery);
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
                child: ListView.builder(
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
                              icon: const Icon(Icons.edit),
                              color: Colors.black,
                            ),
                                         IconButton(onPressed: (){
                              showDialog(context: context, builder: (context){
                                 return AlertDialog(
                                  title: Text('Are you sure want to delete'),
                                  actions: [TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('close')),
                                  TextButton(onPressed: (){
                                    deleteitems(index);
                                  Navigator.pop(context);

                                  }, child: Text('delete'))],
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

class OthersSearchDelegate extends SearchDelegate {
  final List<ItemsModel> itemList;

  OthersSearchDelegate(this.itemList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults();
  }

  Widget buildSearchResults() {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final data = itemList[index];
        return ListTile(
          title: Text(data.name),
          subtitle: Text(data.item),
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
        );
      },
    );
  }
}
