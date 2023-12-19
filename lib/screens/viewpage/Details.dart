
import 'dart:io';

import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  final String name;
  final String num;
  final String item;
  final String sellprice;
  final String costprice;
  final String image;

  Detailspage({
    required this.name,
    required this.num,
    required this.item,
    required this.sellprice,
    required this.image,
     required this.costprice,
  });

//ignore_for_file: prefer_const_constructors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 2, 85, 1),
        title: Text('Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
       body:SingleChildScrollView (
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: FileImage(File(image)),
                radius: 80,
              ),
              SizedBox(height: 20),
              ProfileCard(
                title: 'itemName',
                content: name,
              ),          
              ProfileCard(
                title: 'stall number',
                content:num,
              ),
              ProfileCard(
                title: 'select item',
                content: item,
              ),
              ProfileCard(
                title: 'selling price',
                content: sellprice,
              ),
               ProfileCard(
                title: 'cost price',
                content: costprice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String content;

  const ProfileCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 155, 165),
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 19, 155, 165)),
            ),
          ],
        ),
      ),
    );
  }
}