
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Logoutpage extends StatelessWidget {
  const Logoutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        centerTitle: true,
        backgroundColor: Colors.green, 
      ),
      body: Center(
        child: Text('Logout Content Goes Here'),
      ),
    );

  }
}

