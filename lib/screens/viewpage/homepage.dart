// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/screens/viewpage/details.dart';
import 'package:stockapp/screens/viewpage/editpage.dart';
import 'package:stockapp/loginscreen.dart';
import 'package:stockapp/widget/drawer_page.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List<String> imageList = [
    'assets/download.png',
    'assets/download.png',
    'assets/download.png',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getAllitems();
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        elevation: 100,
        shadowColor: const Color.fromARGB(255, 227, 227, 226),
        child: Container(
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(child: DrawerHeaderWidget()),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'MedDeaL',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: CarouselSlider(
                items: imageList.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  initialPage: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 220, 251),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                 //   filterItems(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: itemlistnotifier,
              builder: (BuildContext, List<ItemsModel> itemlist, Widget? child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemlist.length,
                  itemBuilder: (context, index) {
                    final reverseindex = itemlist.length - 1 - index;
                    final data = itemlist[reverseindex];
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
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Are you sure want to delete'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('close'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            deleteitems(reverseindex);
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final sharedperfer = await SharedPreferences.getInstance();
    await sharedperfer.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => ScreenLogin()),
      (route) => false,
    );
  }

  // void filterItems(String query) {
  //   query = query.toLowerCase(); // Convert the query to lowercase for case-insensitive comparison

  //   List<ItemsModel> filteredItems = [];

  //   // Iterate through all items and add those that match the query to the filtered list
  //   for (var item in itemlistnotifier.value) {
  //     if (item.name.toLowerCase().contains(query) ||
  //         item.num.toLowerCase().contains(query) ||
  //         item.item.toLowerCase().contains(query) ||
  //         item.sellprice.toLowerCase().contains(query) ||
  //         item.costprice.toLowerCase().contains(query)) {
  //       filteredItems.add(item);
  //     }
  //   }

   
  //   var filteredItemList = filteredItems;
  // }
}


