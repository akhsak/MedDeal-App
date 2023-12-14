
import 'package:flutter/material.dart';

class saniterspage extends StatefulWidget {
  const saniterspage({Key? key}) : super(key: key);

  @override
  State<saniterspage> createState() => _saniterspageState();
}

class _saniterspageState extends State<saniterspage> {
  List<String> medicineList = [
    'Medicine 1',
    'Medicine 2',
    'Medicine 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('saniters List'),
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
   

