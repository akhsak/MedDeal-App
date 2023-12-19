// // import 'package:flutter/material.dart';

// // class Detailspage extends StatefulWidget {
// //   final String name;
// //   final String age;
// //   final String course;
// //   final String phone;
// //   final String image;

// //   const Detailspage(
// //         Key? key,
// //     required this.name,
// //     required this.age,
// //     required this.course,
// //     required this.phone,
// //     required this.image,
// //   {super.key});

// //   @override
// //   State<Detailspage> createState() => _DetailspageState();
// // }

// // class _DetailspageState extends State<Detailspage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Details',style: TextStyle(color: Colors.white),),
// //         centerTitle: true,
// //         backgroundColor:  Color.fromRGBO(12, 2, 85, 1),
// //       ),
// //        body:SingleChildScrollView (
// //         child: Container(
// //           margin: EdgeInsets.all(20),
// //           child: Column(
// //             children: [
// //               CircleAvatar(
// //                 backgroundImage: FileImage(File(widget.image)),
// //                 radius: 80,
// //               ),
// //               SizedBox(height: 20),
// //               ProfileCard(
// //                 title: 'Name',
// //                 content: widget.name,
// //               ),
// //               ProfileCard(
// //                 title: 'Age',
// //                 content: widget.age,
// //               ),
// //               ProfileCard(
// //                 title: 'Course',
// //                 content: widget.course,
// //               ),
// //               ProfileCard(
// //                 title: 'Phone',
// //                 content: widget.phone,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ProfileCard extends StatelessWidget {
// //   final String title;
// //   final String content;

// //   const ProfileCard({
// //     required this.title,
// //     required this.content,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 5,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       color: Colors.white,
// //       child: Container(
// //         padding: EdgeInsets.all(20),
// //         width: double.infinity,
// //         height: 100,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               title,
// //               style: TextStyle(
// //                 fontSize: 15,
// //                 fontWeight: FontWeight.bold,
// //                 color: Color.fromARGB(255, 19, 155, 165),
// //               ),
// //             ),
// //             SizedBox(height: 8),
// //             Text(
// //               content,
// //               style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                   color: Color.fromARGB(255, 19, 155, 165)),
// //             ),
// //           ],
// //         ),
// //       ),

// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';

// class Detailspage extends StatefulWidget {
//   final String name;
//   final String age;
//   final String course;
//   final String phone;
//   final String image;

//   const Detailspage({
//     Key? key,
//     required this.name,
//     required this.age,
//     required this.course,
//     required this.phone,
//     required this.image,
//   }) : super(key: key);

//   @override
//   State<Detailspage> createState() => _DetailspageState();
// }

// class _DetailspageState extends State<Detailspage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Details',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(12, 2, 85, 1),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 backgroundImage: FileImage(File(widget.image)),
//                 radius: 80,
//               ),
//               SizedBox(height: 20),
//               ProfileCard(
//                 title: 'Name',
//                 content: widget.name,
//               ),
//               ProfileCard(
//                 title: 'Age',
//                 content: widget.age,
//               ),
//               ProfileCard(
//                 title: 'Course',
//                 content: widget.course,
//               ),
//               ProfileCard(
//                 title: 'Phone',
//                 content: widget.phone,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfileCard extends StatelessWidget {
//   final String title;
//   final String content;

//   const ProfileCard({
//     required this.title,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       color: Colors.white,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         width: double.infinity,
//         // Allow height to be determined by the content
//         height: null,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 19, 155, 165),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               content,
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 19, 155, 165)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  final String name;
  final String num;
  final String item;
  final String price;
  final String image;
  Detailspage(
      {required this.name,
      required this.num,
      required this.item,
      required this.price,
      required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 2, 85, 1) ,
        title: Text('Details',style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        
        child: Container(
          margin: EdgeInsets.all(50),
          height: 100,
          width: double.infinity,
          color: const Color.fromARGB(255, 157, 156, 154),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
         backgroundImage: AssetImage(image),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(name),
                    Text(num),
                    Text(item),
                    Text(price),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
