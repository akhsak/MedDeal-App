
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stockapp/db/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/screens/viewpage/Editpage.dart';
import 'package:stockapp/screens/viewpage/details.dart';

class Otherspag extends StatefulWidget {
  const Otherspag({Key? key}) : super(key: key);

  @override
  State<Otherspag> createState() => _OtherspageState();
}

class _OtherspageState extends State<Otherspag> {
  List<ItemsModel> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Others List'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: OthersSearchDelegate(itemList),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: itemlistnotifier,
        builder: (BuildContext, List<ItemsModel> Itemlist, Widget? child) {
          itemList =
              Itemlist.where((food) => food.item.split(',').map((category) => category.trim().toLowerCase()).contains('others')).toList();

          return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final reverseindex = itemList.length - 1 - index;
              final data = itemList[reverseindex];
              return Card(
                color: const Color.fromARGB(255, 250, 251, 252),
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
                      IconButton(
                        onPressed: () {
                          deleteitems(index);
                        },
                        icon: const Icon(Icons.delete),
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
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
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
    final searchResults = itemList
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final data = searchResults[index];
        return Card(
          color: Color.fromARGB(255, 250, 251, 252),
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
                  icon: Icon(Icons.edit),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    deleteitems(index);
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = itemList
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final data = suggestionList[index];
        return ListTile(
          title: Text(data.name),
          onTap: () {
            query = data.name;
            showResults(context);
          },
        );
      },
    );
  }
}




