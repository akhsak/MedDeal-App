// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/bottom_provider.dart';

import 'package:stockapp/view/screen/add_page.dart';
import 'package:stockapp/view/screen/chart_page.dart';
import 'package:stockapp/view/screen/home_page.dart';
import 'package:stockapp/view/screen/items_page.dart';
import 'package:stockapp/view/screen/profit_page.dart';

class Bottombar extends StatelessWidget {
  Bottombar({
    super.key,
  });

  List pages = [
    Homepage(),
    Itemspage(),
    ProfitPage(),
    PieChart(),
  ];

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BottomProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Consumer<BottomProvider>(
          builder: (context, value, child) => pages[value.myIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(22.10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: pro.onTap,
              backgroundColor: const Color.fromARGB(24, 7, 100, 95),
              currentIndex: pro.myIndex,
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
