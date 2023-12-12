// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Appinfopage extends StatelessWidget {
  const Appinfopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('App info',style: TextStyle(color: Colors.white),),
       centerTitle: true,
       backgroundColor: Colors.green,
       
        ),
      );
  }
}