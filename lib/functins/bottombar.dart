// import 'package:flutter/material.dart';
// import 'package:stockapp/screens/cartpage.dart';
// import 'package:stockapp/screens/homepage.dart';
// import 'package:stockapp/screens/itemAddpage.dart';

// class Bottombar extends StatefulWidget {
//   const Bottombar({super.key});

//   @override
//   State<Bottombar> createState() => _BottombarState();
// }

// class _BottombarState extends State<Bottombar> {
//    int _myIndex = 0;
//   void navigatebottombar(int index) {
//     setState(() {
//       _myIndex = index;
//     });
//   }

//   final home = [
//     homepage(),
//     Cartpage(),
//     Addpage(),
    

   
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: home[_myIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.shifting,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//        onTap: navigatebottombar,
//         currentIndex: _myIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: "home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.category,
//             ),
//             label: "items",
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add_box,
//               ),
//               label: 'Add'),
//           // BottomNavigationBarItem(
//           //     icon: Icon(
//           //       Icons.category_sharp,
//           //     ),
//           //     label: 'Categories'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.settings,
//               ),
//               label: 'Settings'),
//         ],
//       ),
//     );
//   }
// }