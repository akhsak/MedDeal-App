// // ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:stockapp/controller/cateogory_provider.dart';
// import 'package:stockapp/controller/db_provider.dart';
// import 'package:stockapp/model/data_model.dart';
// import 'package:lottie/lottie.dart';
// import 'package:stockapp/view/screen/details.dart';
// import 'package:stockapp/view/screen/edit_page.dart';

// class Categorypage extends StatefulWidget {
//   final String category;

//   Categorypage({required this.category, Key? key}) : super(key: key);

//   @override
//   State<Categorypage> createState() => _CategorypageState();
// }

// class _CategorypageState extends State<Categorypage> {
//   @override
//   Widget build(BuildContext context) {
//     final dbprovider = Provider.of<DbProvider>(context, listen: false);
//     final catProvider = Provider.of<CategoryProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.category} List'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: catProvider.searchController,
//               onChanged: (value) {
//                 setState(() {}); // Trigger a rebuild to update the UI
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     catProvider.searchController.clear();

//                     setState(() {}); // Trigger a rebuild to update the UI
//                   },
//                   icon: const Icon(Icons.clear),
//                 ),
//               ),
//             ),
//           ),
//           Consumer<DbProvider>(
//             builder: (context, value, child) {
//               var itemLis = value.meddeal
//                   .where((ItemsModel items) => items.item
//                       .toLowerCase()
//                       .contains(widget.category.toLowerCase()))
//                   .toList();
//               String searchQuery =
//                   catProvider.searchController.text.toLowerCase();
//               List<ItemsModel> filteredItemList = itemLis
//                   .where(
//                       (item) => item.name.toLowerCase().contains(searchQuery))
//                   .toList();

//               return Expanded(
//                 child: filteredItemList.isEmpty
//                     ? Lottie.asset(
//                         "assets/Animation - 1704946991285.json",
//                         width: 200,
//                       )
//                     : ListView.builder(
//                         itemCount: filteredItemList.length,
//                         itemBuilder: (context, index) {
//                           final data = filteredItemList[index];
//                           return Card(
//                             color: const Color.fromARGB(255, 241, 242, 243),
//                             child: ListTile(
//                               onTap: () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Detailspage(
//                                     name: data.name,
//                                     num: data.numbr,
//                                     item: data.item,
//                                     sellprice: data.sellprice,
//                                     costprice: data.costprice,
//                                     image: data.image!,
//                                   ),
//                                 ),
//                               ),
//                               title: Text(data.name),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(data.numbr),
//                                   Text(data.item),
//                                   Text(data.sellprice),
//                                   Text(data.costprice),
//                                 ],
//                               ),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Editpage(
//                                           costprice: data.costprice,
//                                           id: index,
//                                           items: data.item,
//                                           name: data.name,
//                                           numbr: data.numbr,
//                                           sellprice: data.sellprice,
//                                           imagePath: data.image!,
//                                         ),
//                                       ),
//                                     ),
//                                     icon: const Icon(Icons.edit),
//                                     color: Colors.black,
//                                   ),
//                                   IconButton(
//                                     onPressed: () => showDialog(
//                                       context: context,
//                                       builder: (context) => AlertDialog(
//                                         title: const Text(
//                                             'Are you sure want to delete'),
//                                         actions: [
//                                           TextButton(
//                                             onPressed: () =>
//                                                 Navigator.pop(context),
//                                             child: const Text('close'),
//                                           ),
//                                           TextButton(
//                                             onPressed: () {
//                                               dbprovider.deleteitems(index);
//                                               Navigator.pop(context);
//                                             },
//                                             child: const Text('delete'),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     icon: const Icon(Icons.delete),
//                                     color: Colors.black,
//                                   ),
//                                 ],
//                               ),
//                               leading: CircleAvatar(
//                                 backgroundImage: FileImage(File(data.image!)),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// Categorypage.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/cateogory_provider.dart';
import 'package:stockapp/controller/db_provider.dart';
import 'package:stockapp/model/data_model.dart';
import 'package:lottie/lottie.dart';
import 'package:stockapp/view/screen/details.dart';
import 'package:stockapp/view/screen/edit_page.dart';

class Categorypage extends StatelessWidget {
  final String category;

  Categorypage({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbprovider = Provider.of<DbProvider>(context, listen: false);
    final catProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('$category List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: catProvider.searchController,
              onChanged: (value) {
                catProvider.updateSearchQuery(value);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  onPressed: () {
                    catProvider.clearSearch();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Consumer<DbProvider>(
            builder: (context, value, child) {
              var itemLis = value.meddeal
                  .where((ItemsModel items) =>
                      items.item.toLowerCase().contains(category.toLowerCase()))
                  .toList();

              List<ItemsModel> filteredItemList = itemLis
                  .where((item) => item.name.toLowerCase().contains(catProvider.searchQuery))
                  .toList();

              return Expanded(
                child: filteredItemList.isEmpty
                    ? Lottie.asset(
                        "assets/Animation - 1704946991285.json",
                        width: 200,
                      )
                    : ListView.builder(
                        itemCount: filteredItemList.length,
                        itemBuilder: (context, index) {
                          final data = filteredItemList[index];
                          return Card(
                            color: const Color.fromARGB(255, 241, 242, 243),
                            child: ListTile(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailspage(
                                    name: data.name,
                                    num: data.numbr,
                                    item: data.item,
                                    sellprice: data.sellprice,
                                    costprice: data.costprice,
                                    image: data.image!,
                                  ),
                                ),
                              ),
                              title: Text(data.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.numbr),
                                  Text(data.item),
                                  Text(data.sellprice),
                                  Text(data.costprice),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Editpage(
                                          costprice: data.costprice,
                                          id: index,
                                          items: data.item,
                                          name: data.name,
                                          numbr: data.numbr,
                                          sellprice: data.sellprice,
                                          imagePath: data.image!,
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black,
                                  ),
                                  IconButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text(
                                            'Are you sure want to delete'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('close'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              dbprovider.deleteitems(index);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('delete'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    icon: const Icon(Icons.delete),
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundImage: FileImage(File(data.image!)),
                              ),
                            ),
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}

