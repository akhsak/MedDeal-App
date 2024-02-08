import 'package:hive/hive.dart';
import 'package:stockapp/model/data_model.dart';

class DbServices {
  Future<List<ItemsModel>> getAllitems() async {
    final itemsDB = await Hive.openBox<ItemsModel>('items_db');
    return itemsDB.values.toList();
  }

  additems(ItemsModel value) async {
    final itemsDB = await Hive.openBox<ItemsModel>('items_db');
    await itemsDB.add(value);
  }
     Future deleteitems(int index) async {
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  await itemsDB.deleteAt(index);
  
}
Future edit(int index, ItemsModel value) async {
final itemsDB = await Hive.openBox<ItemsModel>('items_db');
await  itemsDB.putAt(index, value);
}

Future deleteAllitems() async {
  final itemsDB = await Hive.openBox<ItemsModel>('items_db');
  await itemsDB.clear();
 
}
 
}




