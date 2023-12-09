import 'package:flutter/material.dart';

class ResetApp extends StatelessWidget {
  const ResetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       title: Container(
        alignment:Alignment.center,
        child: Text('ResetApp'),
        ),
      ),
    );
  }
}