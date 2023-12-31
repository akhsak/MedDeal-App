
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:stockapp/view/viewpage/Profitpage.dart';
import 'package:stockapp/view/viewpage/addpage.dart';
import 'package:stockapp/view/viewpage/chartpage.dart';
import 'package:stockapp/view/viewpage/homepage.dart';
import 'package:stockapp/view/viewpage/itemspage.dart';

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
    ProfitPage(),
    PieChart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[_myIndex],
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(12, 2, 85, 1),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                color: Color.fromRGBO(241, 240, 243, 1),

                onPressed: () => navigateBottomBar(0),
              ),
              IconButton(
                icon: Icon(Icons.category),
               color: Color.fromARGB(255, 253, 252, 252),
                onPressed: () => navigateBottomBar(1),
              ),
              SizedBox(), 
              IconButton(
                icon: Icon(Icons.history),
                color: Colors.white,
                onPressed: () => navigateBottomBar(2),
              ),
              IconButton(
                icon: Icon(Icons.equalizer_rounded),
                color: Colors.white,
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


        
   