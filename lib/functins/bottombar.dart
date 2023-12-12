
// ignore_for_file: prefer_const_constructors

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

  final List<Widget> pages = [
    Homepage(),
    Itemspage(),
    // Addpage(),
    Historypage(),
    Settingpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        // Add more app bar customization if needed
      ),
      body: pages[_myIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.black,

                onPressed: () => navigateBottomBar(0),
              ),
              IconButton(
                icon: Icon(Icons.category),
               color: Colors.black,
                onPressed: () => navigateBottomBar(1),
              ),
              SizedBox(), // SizedBox to create space for the FloatingActionButton
              IconButton(
                icon: Icon(Icons.history),
                color: Colors.black,
                onPressed: () => navigateBottomBar(2),
              ),
              IconButton(
                icon: Icon(Icons.settings),
                color: Colors.black,
                onPressed: () => navigateBottomBar(3),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 219, 218, 215),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Addpage()));
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


        
   