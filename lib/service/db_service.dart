// import 'package:hive/hive.dart';
// import 'package:stockapp/model/datamodel.dart';

// class DbServices {

// Future<List<ItemsModel>> getAllitems() async {
//   final itemsDB = await Hive.openBox<ItemsModel>('items_db');
//   return itemsDB.values.toList();
// }

//    additems(ItemsModel value) async {
//     final itemsDB = await Hive.openBox<ItemsModel>('items_db');
//     await itemsDB.add(value);
//     print('aaaa');
//   }
//   Future deleteitems(int index) async {
//   final itemsDB = await Hive.openBox<ItemsModel>('items_db');
//   await itemsDB.deleteAt(index);
//   // getAllitems();
// }

// // Future edit(int id, ItemsModel value) async {
// //   final itemsDB = await Hive.openBox<ItemsModel>('items_db');
// //   itemsDB.putAt(id, value);
// // }

// //   // Future<void> getAllitems(ItemsModel value) async {
// //   //   final itemsDB = await Hive.openBox<ItemsModel>('items_db');
// //   //   await itemsDB.add(value);
// //   // }

// //   Future<void> deleteAllitems() async {
// //     final itemsDB = await Hive.openBox<ItemsModel>('items_db');
// //     await itemsDB.clear();
// // //  getAllitems();
// //   }

// //   Future<void> edit(int id, ItemsModel value) async {
// //     final itemsDB = await Hive.openBox<ItemsModel>('items_db');
// //     itemsDB.putAt(id, value);
// //   }

// //   Future<void> deleteitems(int id) async {
// //     final itemsDB = await Hive.openBox<ItemsModel>('items_db');
// //     itemsDB.deleteAt(id);
// // //  getAllitems();
// //   }
// }

