
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stockapp/screens/cateqory/Equipments.dart';
import 'package:stockapp/screens/cateqory/Medicine.dart';
import 'package:stockapp/screens/cateqory/Saniters.dart';
import 'package:stockapp/screens/cateqory/others.dart';

class Itemspage extends StatelessWidget {
  const Itemspage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(12, 2, 85, 1),
        title: Text(
          'Items',
          style: TextStyle(color: Color.fromRGBO(243, 243, 245, 1), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCategoryCard('Medicine', IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Medicinepage()));
            },
            icon: Icon(Icons.medical_services_outlined),
            color: Colors.red,
          )),
          _buildCategoryCard('Equipments', IconButton(
            onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Equipmentspage()));
            },
            icon: Icon(Icons.electrical_services),
            color: Colors.orange,
          )),
          _buildCategoryCard(
            'Saniters', IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Saniterspage()));
},
            icon: Icon(Icons.equalizer_sharp),
            color: Colors.green,
          )),
          _buildCategoryCard('others', IconButton(
            onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Otherspage()));
            },
            icon: Icon(Icons.abc),
            color: Colors.blue,
          )),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconButton iconButton) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconButton,
            SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      );
      
  }
}

