
// // ignore_for_file: prefer_const_constructors

// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:stockapp/screens/cateqory/Equipments.dart';
// import 'package:stockapp/screens/cateqory/Medicine.dart';
// import 'package:stockapp/screens/cateqory/Saniters.dart';
// import 'package:stockapp/screens/cateqory/others.dart';

// class Itemspage extends StatelessWidget {
//    Itemspage({Key? key});

//   final List<CategoryData> categories = [
//     CategoryData('Medicine', Icons.medical_services_outlined, Colors.red, Medicinepage()),
//     CategoryData('Equipments', Icons.electrical_services, Colors.orange, Equipmentspage()),
//     CategoryData('Saniters', Icons.equalizer_sharp, Colors.green, Saniterspage()),
//     CategoryData('others', Icons.abc, Colors.blue, Otherspage()),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(12, 2, 85, 1),
//         title: Text(
//           'Items',
//           style: TextStyle(color: Color.fromRGBO(243, 243, 245, 1), fontWeight: FontWeight.bold),
//         ),

//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//         ),
//         padding: EdgeInsets.all(16.0),
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//         //  return _buildCategoryCard(categories[index]);
//         return GestureDetector(
//            Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => categories[index],
//                   ),
//                 );
//               },
//         ),
//         },
      
    
//   }

//   Widget _buildCategoryCard(CategoryData category) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: InkWell(
//         onTap: () {
//        //   Navigator.push(context, MaterialPageRoute(builder: (context) => ));
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               category.icon,
//               color: category.color,
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               category.title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryData {
//   final String title;
//   final IconData icon;
//   final Color color;
//   final Widget route;

//   CategoryData(this.title, this.icon, this.color, this.route);
// }

// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:stockapp/screens/cateqory/Equipments.dart';
import 'package:stockapp/screens/cateqory/Medicine.dart';
import 'package:stockapp/screens/cateqory/Saniters.dart';
import 'package:stockapp/screens/cateqory/others.dart';

class Itemspage extends StatelessWidget {
  Itemspage({Key? key});

  List categories = [
    'Medicine', Icons.medical_services_outlined, Colors.red, Medicinepage(),
    'Equipments', Icons.electrical_services, Colors.orange, Equipmentspage(),
    'Saniters', Icons.equalizer_sharp, Colors.green, Saniterspage(),
     'others', Icons.abc, Colors.blue, Otherspage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 2, 85, 1),
        title: Text(
          'Items',
          style: TextStyle(color: Color.fromRGBO(243, 243, 245, 1), fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        padding: EdgeInsets.all(16.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => categories[index].route,
                ),
              );
            },
            child: _buildCategoryCard(categories[index]),
          );
        },
      ),
    );
  }

  Widget _buildCategoryCard(CategoryData category) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: GestureDetector(
        onTap: () {
         Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => category.route));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: category.color,
            ),
            SizedBox(height: 20.0),
            Text(
              category.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryData {
  final String title;
  final IconData icon;
  final Color color;
  final Widget route;

  CategoryData(this.title, this.icon, this.color, this.route);
}

