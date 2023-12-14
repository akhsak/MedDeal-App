
import 'package:flutter/material.dart';

class Equipmentspage extends StatefulWidget {
  const Equipmentspage({Key? key}) : super(key: key);

  @override
  State<Equipmentspage> createState() => _EquipmentspageState();
}

class _EquipmentspageState extends State<Equipmentspage> {
  List<String> medicineList = [
    'Medicine 1',
    'Medicine 2',
    'Medicine 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipments List'),
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
   

