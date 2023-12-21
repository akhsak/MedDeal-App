
// // import 'package:flutter/material.dart';

// // class saniterspage extends StatefulWidget {
// //   const saniterspage({Key? key}) : super(key: key);

// //   @override
// //   State<saniterspage> createState() => _saniterspageState();
// // }

// // class _saniterspageState extends State<saniterspage> {
// //   List<String> medicineList = [
// //     'Medicine 1',
// //     'Medicine 2',
// //     'Medicine 3',
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('saniters List'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: medicineList.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text(medicineList[index]),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
   
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:stockapp/db/functions/db_function.dart';
// import 'package:stockapp/model/datamodel.dart';
// import 'package:stockapp/screens/viewpage/Editpage.dart';
// import 'package:stockapp/screens/viewpage/details.dart';

// class Saniterspage extends StatefulWidget {
//   const Saniterspage({Key? key}) : super(key: key);

//   @override
//   State<Saniterspage> createState() => _SaniterspageState();
// }

// class _SaniterspageState extends State<Saniterspage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saniters List'),
//       ),
//       body:  ValueListenableBuilder(
//               valueListenable: itemlistnotifier,
//               builder:
//                   (BuildContext, List<ItemsModel> Itemlist, Widget? child) {
//                      final itemlist = Itemlist
//             .where((food) =>
//                 food.item.contains('Saniters') == true)
//             .toList();
//                 return ListView.builder(
//                   itemCount: itemlist.length,
//                   itemBuilder: (context, index) {
//                     final reverseindex=itemlist.length-1-index;
//                     final data = itemlist[reverseindex];
//                     return Card(
//                       color: Color.fromARGB(255, 250, 251, 252),
//                       child: ListTile(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailspage(
//                             name: data.name,
//                             num: data.num,
//                             item: data.item,
//                            sellprice: data.sellprice,
//                             costprice:data.costprice,

//                             image: data.image!,
//                           )));
//                         },
//                         title: Text(data.name),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(data.num),
//                             Text(data.item),          
//                             Text(data.sellprice), 
//                             Text(data.costprice)              
//                           ],
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
//                                 Editpage(

//                                   costprice: data.costprice,
//                                   index: index,
//                                   items:data.item ,
//                                   name: data.name,
//                                   num:data.num ,
//                                   sellprice:data.sellprice ,
//                                   imagePath:data.image! ,
//                                 )
//                                ));
//                               },
//                               icon: Icon(Icons.edit),
//                               color: Colors.black,
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 deleteitems(index);
//                               },
//                               icon: Icon(Icons.delete),
//                               color: Colors.black,
//                             ),
//                           ],
//                         ),
//                         leading: CircleAvatar(
                          
//                          backgroundImage: 
//                          FileImage(File(data.image!)),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ));
//   }
// }
   

// import 'package:flutter/material.dart';

// class Equipmentspage extends StatefulWidget {
//   const Equipmentspage({Key? key}) : super(key: key);

//   @override
//   State<Equipmentspage> createState() => _EquipmentspageState();
// }

// class _EquipmentspageState extends State<Equipmentspage> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: SafeArea(
//         child: ListView(children:
//           List.generate(100, (index) {
//             return Column(
//              children: [
//               Text('ithem $index'),
//               Divider(),
//              ],
//             );
//           }
//        )
        
//         ),
//       ),
//     );
//   }
// }
   
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stockapp/db/functions/db_function.dart';
import 'package:stockapp/model/datamodel.dart';
import 'package:stockapp/screens/viewpage/Editpage.dart';
import 'package:stockapp/screens/viewpage/details.dart';

class Saniterspage extends StatefulWidget {
  const Saniterspage({Key? key}) : super(key: key);

  @override
  State<Saniterspage> createState() => _SaniterspageState();
}

class _SaniterspageState extends State<Saniterspage> {
  List categories = [
    'Medicine',
    'Equipments',
    'Saniters', 
     'others', 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saniters List'),
      ),
      body:  ValueListenableBuilder(
              valueListenable: itemlistnotifier,
              builder:
                  (BuildContext, List<ItemsModel> Itemlist, Widget? child) {
                     final itemlist = Itemlist
            .where((food) =>
                food.item.contains('Saniters') == true)
            .toList();
                return ListView.builder(
                  itemCount: itemlist.length,
                  itemBuilder: (context, index) {
                    final reverseindex=itemlist.length-1-index;
                    final data = itemlist[reverseindex];
                    return Card(
                      color: Color.fromARGB(255, 250, 251, 252),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailspage(
                            name: data.name,
                            num: data.num,
                            item: data.item,
                           sellprice: data.sellprice,
                            costprice:data.costprice,

                            image: data.image!,
                          )));
                        },
                        title: Text(data.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.num),
                            Text(data.item),          
                            Text(data.sellprice), 
                            Text(data.costprice)              
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                Editpage(

                                  costprice: data.costprice,
                                  index: index,
                                  items:data.item ,
                                  name: data.name,
                                  num:data.num ,
                                  sellprice:data.sellprice ,
                                  imagePath:data.image! ,
                                )
                               ));
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.black,
                            ),
                            IconButton(
                              onPressed: () {
                                deleteitems(index);
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.black,
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          
                         backgroundImage: 
                         FileImage(File(data.image!)),
                        ),
                      ),
                    );
                  },
                );
              },
            ));
  }
}
   






