
import 'package:flutter/material.dart';

class Medicinepage extends StatefulWidget {
  const Medicinepage({Key? key}) : super(key: key);

  @override
  State<Medicinepage> createState() => _MedicinepageState();
}

class _MedicinepageState extends State<Medicinepage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Medicines'),
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
