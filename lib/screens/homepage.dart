

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:stockapp/screens/Drawer.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   List<String> imageList = [
//     'assets/download.png',
//     'assets/download.png',
//     'assets/download.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
        
//       ),drawer: Drawer(
//         elevation: 100,
//         shadowColor: const Color.fromARGB(255, 227, 227, 226),
//         child: Container(
//           color: Color(0xFFFFFFFF),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Text(
//                     "settings",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(child: 
//               ()),
//             ],
//           ),
//         ),
//       ),
//       body:Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Hello!',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(height: 3),
//                     Text(
//                       'MedDeaL',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 25),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 250, // Set the height of the container to 250
//             child: CarouselSlider(
//               items: imageList.map((item) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 500, // Set the height of the CarouselSlider to 500
//                       child: Image.asset(
//                         item,
//                         fit: BoxFit.cover, // Fit the image within the container
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//               options: CarouselOptions(
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 2.0, // Set a fixed aspect ratio
//                 viewportFraction: 1.0, // Set this to 1.0 to occupy the full width
//                 initialPage: 0,
//               ),
//             ),
//           ),
//           SizedBox(height: 25),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return Card(
//                   color: Color.fromARGB(255, 250, 251, 252), // Set card color
//                   child: ListTile(
//                     title: Text('Item $index', style: TextStyle(color: Color.fromARGB(255, 3, 3, 3))),
//                     subtitle: Text('Description of Item $index', style: TextStyle(color: Color.fromARGB(255, 8, 8, 8))),
//                     leading: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 6, 6, 6)),
//                     // Add more properties or customize ListTile as needed
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Homepage(),
//     ),
//   );
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stockapp/screens/Drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> imageList = [
    'assets/download.png',
    'assets/download.png',
    'assets/download.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        elevation: 100,
        shadowColor: const Color.fromARGB(255, 227, 227, 226),
        child: Container(
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: // Add your drawer content here
                    Container(),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'MedDeaL',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: CarouselSlider(
              items: imageList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 1.0,
                initialPage: 0,
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 250, 251, 252),
                  child: ListTile(
                    title: Text('Item $index', style: TextStyle(color: Color.fromARGB(255, 3, 3, 3))),
                    subtitle: Text('Description of Item $index', style: TextStyle(color: Color.fromARGB(255, 8, 8, 8))),
                    leading: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 6, 6, 6)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Homepage(),
    ),
  );
}
