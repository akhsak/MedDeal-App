// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/functions/db_function.dart';
import 'package:stockapp/model/data_model.dart';
import 'package:lottie/lottie.dart';
import 'package:stockapp/view/screen/details.dart';
import 'package:stockapp/view/screen/edit_page.dart';

class Equipmentspage extends StatefulWidget {
  const Equipmentspage({Key? key}) : super(key: key);

  @override
  State<Equipmentspage> createState() => _EquipmentspageState();
}

class _EquipmentspageState extends State<Equipmentspage> {
  TextEditingController searchController = TextEditingController();
  List<ItemsModel> itemList = [];

  @override
  Widget build(BuildContext context) {
    final pro=Provider.of<DbProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment List'),
      ),
      body: Consumer<DbProvider>(
        builder: (context, value, child) 
        // valueListenable: itemlistnotifier,
        // builder:
        //     (BuildContext context, List<ItemsModel> itemlist, Widget? child) 
        {
          itemList = value.meddeal
              .where((items) => items.item.toLowerCase().contains('equipments'))
              .toList();
          String searchQuery = searchController.text.toLowerCase();
          List<ItemsModel> filteredItemList = itemList
              .where((item) =>
                  item.name.toLowerCase().contains(searchQuery)
                  // ||
                 // item.name.toUpperCase().contains(searchQuery)
                 )
              .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                      onPressed: searchController.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ),
              Expanded(
                child: filteredItemList.isEmpty
                    ? Lottie.asset(
                      "assets/Animation - 1704946991285.json",width: 200,
                    )
                    : ListView.builder(
                        itemCount: filteredItemList.length,
                        itemBuilder: (context, index) {
                          final data = filteredItemList[index];
                          return Card(
                            color: const Color.fromARGB(255, 241, 242, 243),
                            child: ListTile(
                              onTap: () => Navigator.push(
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
                              ),
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
                                    onPressed: () => Navigator.push(
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
                                    ),
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black,
                                  ),
                                  IconButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text(
                                            'Are you sure want to delete'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('close'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                            pro.deleteitems(index);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('delete'),
                                          ),
                                        ],
                                      ),
                                    ),
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
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
