// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:stockapp/screens/Settings/Logout.dart';
// import 'package:stockapp/screens/Settings/Details.dart';
// import 'package:stockapp/screens/Settings/Appinfo.dart';
// import 'package:stockapp/screens/Settings/Terms.dart';
// import 'package:stockapp/screens/Settings/ResetApp.dart';

// class Settingpage extends StatelessWidget {
//   Settingpage({Key? key});
//   final list = [
//     'Account Details',
//     'Reset App Data',
//     'Send Feedback',
//     'Rate App',
//     'Category',
//   ];
//   final screens = [
//     Detailspage(),
//     ResetApp(),
//     Appinfopage(),
//     Termsprivacy(),
//     Logoutpage()
//   ];

//   final listicons = [
//     Icon(Icons.person),
//     Icon(Icons.restart_alt),
//     Icon(Icons.feedback),
//     Icon(Icons.star_border),
//     Icon(Icons.logout)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Settings', style: TextStyle(color: Colors.white)),

//         leading: (IconButton(
//             onPressed: () {
//             },
//             icon: Icon(Icons.arrow_back),color: Colors.white,)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Card(
//               elevation: 5,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       'Account Details',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     leading: Icon(Icons.person),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 15,
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Detailspage()),
//                       );
//                     },
//                   ),
//                   Divider(),
//                   ListTile(
//                     title: Text(
//                       'Reset App Data',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     leading: Icon(Icons.restart_alt),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 15,
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ResetApp()),
//                       );
//                     },
//                   ),
//                   Divider(),
//                   ListTile(
//                     title: Text(
//                       'App info',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     leading: Icon(Icons.feedback),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 15,
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Appinfopage()),
//                       );
//                     },
//                   ),
//                   Divider(),
//                   ListTile(
//                     title: Text(
//                       'Terms&privacy',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     leading: Icon(Icons.star_border),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 15,
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Termsprivacy()),
//                       );
//                     },
//                   ),
//                   Divider(),
//                   ListTile(
//                     title: Text(
//                       'Logout',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     leading: Icon(Icons.logout),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 15,
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) =>Logoutpage()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        title: ChartTitle(text: 'Sales by sales person'),
        legend: const Legend(isVisible: true),
        series: <PieSeries<_PieData, String>>[
          PieSeries<_PieData, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: pieData,
              xValueMapper: (_PieData data, _) => data.xData,
              yValueMapper: (_PieData data, _) => data.yData,
              dataLabelMapper: (_PieData data, _) => data.text,
              dataLabelSettings: const DataLabelSettings(isVisible: true)),
        ]);
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

final List<_PieData> pieData = [
  _PieData('Category A', 30, '30%'),
  _PieData('Category B', 20, '20%'),
  _PieData('Category C', 15, '15%'),
  _PieData('Category D', 10, '10%'),
  _PieData('Category E', 25, '25%'),
];