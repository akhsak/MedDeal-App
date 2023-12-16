// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stockapp/screens/Settings/Appinfo.dart';
import 'package:stockapp/screens/Settings/Logout.dart';
import 'package:stockapp/screens/Settings/ResetApp.dart';
import 'package:stockapp/screens/Settings/Terms.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const DrawerItem({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> imageList = [
    'assets/download.png',
    'assets/download.png',
    'assets/download.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Appinfopage(),
                  ));
                },
                child: DrawerItem(text: "App info", icon: Icons.info),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Termsprivacy()),
                  );
                },
                child: DrawerItem(
                  text: "Terms and Conditions",
                  icon: Icons.document_scanner_rounded,
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetApp()),
                  );
                },
                child: DrawerItem(
                  text: "ResetApp",
                  icon: Icons.restore_from_trash_outlined,
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Logoutpage()),
                  );
                },
                child: DrawerItem(text: "Logout", icon: Icons.exit_to_app),
              ),
              Divider(),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "version: 1.0.1",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'MedDeaL',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 250, 251, 252),
                  child: ListTile(
                    title: Text('Item $index',
                        style: TextStyle(color: Color.fromARGB(255, 3, 3, 3))),
                    subtitle: Text('Description of Item $index',
                        style: TextStyle(color: Color.fromARGB(255, 8, 8, 8))),
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
