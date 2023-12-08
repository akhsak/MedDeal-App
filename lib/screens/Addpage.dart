// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items',style:TextStyle(fontWeight: FontWeight.bold),),
       // backgroundColor: const Color.fromARGB(255, 135, 128, 128),
      ),
      
    );
  }
}