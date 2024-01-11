
 // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';

import 'package:stockapp/view/viewpage/addpage.dart';
import 'package:stockapp/view/viewpage/chartpage.dart';
import 'package:stockapp/view/viewpage/homepage.dart';
import 'package:stockapp/view/viewpage/itemspage.dart';
import 'package:stockapp/view/viewpage/profitpage.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({
    super.key,
    
  });

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  List pages = [
    Homepage(),
    Itemspage(),
    ProfitPage(),
    PieChart(),
  ];
  int myIndex = 0;

  void onTap(int index) {
    setState(() {
      myIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[myIndex],
        bottomNavigationBar: Padding(
          
          padding: const EdgeInsets.all(22.10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: onTap,
              backgroundColor: const Color.fromARGB(24, 7, 100, 95),
              currentIndex: myIndex,
              selectedItemColor: const Color.fromARGB(255, 9, 49, 83),
              unselectedItemColor: const Color.fromARGB(255, 145, 176, 239),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  label: 'ᴴᵒᵐᵉ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                    size: 25,
                  ),
                  label: 'ᶜᵃᵗᵉᵍᵒʳʸ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,               
                         size: 25,
                  ),
                  label: 'ᵖʳᵒᶠⁱᵗ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.donut_large_rounded,
                    size: 25,
                  ),
                  label: 'ᶜʰᵃʳᵗ',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
            top: 25,
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Addpage(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
        
   