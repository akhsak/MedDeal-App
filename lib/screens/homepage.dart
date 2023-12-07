import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home'),backgroundColor:Color.fromARGB(255, 177, 169, 169)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            
            
          ],
        
        ),
      ),
      
    );
  }
}