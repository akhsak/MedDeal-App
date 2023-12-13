
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
        actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search))
      ],
      ),
      body:Column(
    children: [
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("afad"),
          leading: Icon(Icons.image),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add),
            Icon(Icons.remove)],
          ),
        ),
      ),
      
    ],
   ) ,
   );
    
  }
    
  }
