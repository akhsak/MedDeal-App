import 'package:flutter/material.dart';

class Otherspage extends StatelessWidget {
  const Otherspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Others'),
        centerTitle: true,
        backgroundColor: Colors.green, 
      ),
      body: Center(
        child: Text('otherss'),
      ),
        
      );
    
  }
}