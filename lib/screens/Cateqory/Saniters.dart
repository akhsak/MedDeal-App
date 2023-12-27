
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stockapp/db/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/screens/viewpage/Editpage.dart';
import 'package:stockapp/screens/viewpage/details.dart';

class Saniterspage extends StatefulWidget {
  const Saniterspage({Key? key}) : super(key: key);

  @override
  State<Saniterspage> createState() => _SaniterspageState();
}

class _SaniterspageState extends State<Saniterspage> {
    List<ItemsModel> itemList = [];

  List categories = [
    'Medicine',
    'Equipments',
    'Saniters',
    'others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saniters List'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ValueListenableBuilder(
        valueListenable: itemlistnotifier,
        builder:
            (BuildContext context, List<ItemsModel> Itemlist, Widget? child) {
          final itemlist = Itemlist
              .where((food) => food.item.contains('Saniters') == true)
              .toList();

          return ListView.builder(
            itemCount: itemlist.length,
            itemBuilder: (context, index) {
              final data = itemlist[index];
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
