// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Feedbackpage extends StatelessWidget {
  const Feedbackpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Container(
        alignment:Alignment.center,
        child: Text('feedback'),
        ),
      ),
    );
  }
}