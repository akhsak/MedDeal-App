// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/main.dart';
import 'package:stockapp/screens/bottomtabs/homepage.dart';
import 'package:stockapp/screens/viewpage/loginscreen.dart';

class StockApp extends StatefulWidget {
  const StockApp({Key? key});

  @override
  State<StockApp> createState() => _StockAppState();
}

class _StockAppState extends State<StockApp> {
  @override
  void initState() {
    super.initState();
    log();
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

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const ScreenLogin();
    }));
  }

  Future<void> log() async {
    final sharedperfer = await SharedPreferences.getInstance();

    final userLog = sharedperfer.getBool(savekeyname);
    if (userLog == null || userLog == false) {
      login();
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    }
  }
}
