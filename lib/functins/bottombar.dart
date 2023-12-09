// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stockapp/screens/Addpage.dart';
import 'package:stockapp/screens/history.dart';
import 'package:stockapp/screens/homepage.dart';
import 'package:stockapp/screens/itemspage.dart';
import 'package:stockapp/screens/settingspage.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _myIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _myIndex = index;
    });
  }

  final List<Widget> home = [
    homepage(),
    Itemspage(),
    Addpage(),
    //Historypage(),
    Settingpage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home[_myIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.category, color: Colors.black),
          Icon(Icons.add_box, color: Colors.black),
         //Icon(Icons.history, color: Colors.black),
          Icon(Icons.settings, color: Colors.black),
        ],
        onTap: (index) {
          navigateBottomBar(index);
        },
      ),
    );
  }
}

        
   