
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stockapp/screens/loginscreen.dart';

class StockApp extends StatefulWidget {
  const StockApp({Key? key});

  @override
  State<StockApp> createState() => _StockAppState();
}

class _StockAppState extends State<StockApp> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2), 
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>ScreenLogin(),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/download.png',
          height: 300,
        ),
      ),
    );
  }
}


 