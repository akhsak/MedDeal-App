// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Termsprivacy extends StatelessWidget {
  const Termsprivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:  Text('Terms&Privacy'),
       centerTitle: true,
       backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(80),
              child: Center(
                child: Text(
                  'helloo',style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
         ),
    );
  }
}