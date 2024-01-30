// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 43, 90, 152),
        title: Text('Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: FileImage(File(image)),
                  radius: 80,
                ),
                SizedBox(height: 20),
                ProfileCard(
                  title: 'Item Name',
                  content: name,
                ),
                ProfileCard(
                  title: 'Stall Number',
                  content: num,
                ),
                ProfileCard(
                  title: 'Select Item',
                  content: item,
                ),
                ProfileCard(
                  title: 'Selling Price',
                  content: sellprice,
                ),
                ProfileCard(
                  title: 'Cost Price',
                  content: costprice,
                ),
              ],
            ),
          );
        },
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
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
