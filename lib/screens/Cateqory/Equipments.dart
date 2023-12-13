
import 'package:flutter/material.dart';

class Equipmentspage extends StatefulWidget {
  const Equipmentspage({Key? key}) : super(key: key);

  @override
  State<Equipmentspage> createState() => _EquipmentspageState();
}

class _EquipmentspageState extends State<Equipmentspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('equipments'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('equipments'),
      ),
    );
  }
}
