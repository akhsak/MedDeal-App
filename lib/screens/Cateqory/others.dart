
import 'package:flutter/material.dart';

class Othrespage extends StatefulWidget {
  const Othrespage({Key? key}) : super(key: key);

  @override
  State<Othrespage> createState() => _OthrespageState();
}

class _OthrespageState extends State<Othrespage> {
  List<String> medicineList = [
    'Medicine 1',
    'Medicine 2',
    'Medicine 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('others List'),
      ),
      body: ListView.builder(
        itemCount: medicineList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medicineList[index]),
          );
        },
      ),
    );
  }
}
   

