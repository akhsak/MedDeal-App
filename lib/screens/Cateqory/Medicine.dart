
// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';

// class Medicinepage extends StatefulWidget {
//   const Medicinepage({Key? key}) : super(key: key);

//   @override
//   State<Medicinepage> createState() => _MedicinepageState();
// }

// class _MedicinepageState extends State<Medicinepage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Medicine List'),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

class Medicinepage extends StatefulWidget {
  const Medicinepage({Key? key}) : super(key: key);

  @override
  State<Medicinepage> createState() => _MedicinepageState();
}

class _MedicinepageState extends State<Medicinepage> {
  List<String> medicineList = [
    'Medicine 1',
    'Medicine 2',
    'Medicine 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
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
   

