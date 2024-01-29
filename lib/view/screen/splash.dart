// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockapp/main.dart';
import 'package:stockapp/view/screen/login_screen.dart';
import 'package:stockapp/view/widget/bottombar.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key? key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    log();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/dctrrrr.json',
          height: 300,
        ),
      ),
    );
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenLogin();
    }));
  }

  Future<void> log() async {
    final sharedperfer = await SharedPreferences.getInstance();

    final userLog = sharedperfer.getBool(savekeyname);
    if (userLog == null || userLog == false) {
      login();
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Bottombar()));
    }
  }
}
