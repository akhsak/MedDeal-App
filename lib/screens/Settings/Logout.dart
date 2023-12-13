
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Logoutpage extends StatelessWidget {
  const Logoutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//      return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Confirm Exit"),
//         content: Text("Are you sure you want to exit app?"),
//         actions: [
//           TextButton(
//             child: Text("cancel"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: Text("ok"),
//             onPressed: () {
//               SystemNavigator.pop();
//             },
//           ),
//         ],
//       );
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        centerTitle: true,
        backgroundColor: Colors.green, 
      ),
      body: Center(
        child: Text('Logout Content Goes Here'),
      ),
    );

  }
}

