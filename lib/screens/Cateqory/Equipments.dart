
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
    
      body: SafeArea(
        child: ListView(children:
          List.generate(100, (index) {
            return Column(
             children: [
              Text('ithem $index'),
              Divider(),
             ],
            );
          }
       )
        
        ),
      ),
    );
  }
}
   

