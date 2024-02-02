// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, prefer_const_constructors_in_immutables, must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/controller/db_provider.dart';
//import 'package:stockapp/model/data_model.dart';
import 'package:stockapp/view/screen/details.dart';
import 'package:stockapp/view/screen/edit_page.dart';
import 'package:stockapp/view/screen/search.dart';
import 'package:stockapp/view/screen/login_screen.dart';
import 'package:stockapp/view/widget/drawer_page.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<DbProvider>(context).getAllitems();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 90, 152),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Color.fromARGB(255, 43, 90, 152),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 100,
        shadowColor: Color.fromARGB(255, 80, 80, 79),
        child: Container(
          color: Color.fromARGB(255, 255, 254, 254),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Text(
                  "settings",
                  style: TextStyle(
                    color: Color.fromARGB(255, 43, 90, 152),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'MedDeaL',
                        style: TextStyle(
                            color: Color.fromARGB(255, 249, 249, 250),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 220, 251),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Searchitemss())),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Consumer<DbProvider>(
              builder: (context, value, child) {
                final display = value.meddeal;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: display.length,
                  itemBuilder: (context, index) {
                    final reverseindex = value.meddeal.length - 1 - index;
                    final data = display[reverseindex];
                    return Card(
                      color: Color.fromARGB(255, 207, 220, 251),
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
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
                        title: Text(
                          data.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              data.item,
                              style: TextStyle(
                                fontSize: 11,
                                color: Color.fromARGB(255, 8, 8, 8),
                              ),
                            ),
                            Text(
                              'sell price: ${data.sellprice}',
                              style: TextStyle(
                                fontSize: 11,
                                color: const Color.fromARGB(255, 5, 5, 5),
                              ),
                            ),
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
                                      id: reverseindex,
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
                              color: const Color.fromARGB(255, 246, 244, 244),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          'Are you sure you want to delete?'),
                                      content:
                                          Text('This action cannot be undone.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Provider.of<DbProvider>(context,
                                                    listen: false)
                                                .deleteitems(reverseindex);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete),
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 30,
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

  // List<ItemsModel> _searchList(List<ItemsModel> itemlist) {
  //   final String search = _searchController.text.toLowerCase();
  //   return itemlist.where((item) =>
  //       item.name.toLowerCase().contains(search)
  //       ||    item.sellprice.toLowerCase().contains(search)
  //       ).toList();
  // }

  signout(BuildContext ctx) async {
    final sharedperfer = await SharedPreferences.getInstance();
    await sharedperfer.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => ScreenLogin()),
      (route) => false,
    );
  }
}
