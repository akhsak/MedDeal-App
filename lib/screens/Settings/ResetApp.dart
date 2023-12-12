import 'package:flutter/material.dart';

class ResetApp extends StatelessWidget {
  const ResetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       title: Text('ResetApp',style: TextStyle(color: Colors.white),),
       centerTitle: true,
       backgroundColor: Colors.green,
        ),
    );
  }
}