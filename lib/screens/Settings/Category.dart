import 'package:flutter/material.dart';

class Categorypage extends StatelessWidget {
  const Categorypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Container(
        alignment:Alignment.center,
        child: Text('Cateqory'),
        ),
      ),
      
    );
  }
}