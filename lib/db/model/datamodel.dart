import 'package:hive/hive.dart';
  part 'datamodel.g.dart';

@HiveType(typeId: 3)
class ItemsModel {

  @HiveField(0)
   int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String num;

  @HiveField(3)
  final String item;

  @HiveField(4)
  final String price;
  
   @HiveField(5)
  final String? image;

  ItemsModel({
    required this.name,
    required this.num,
    required this.item,
    required this.price,
     this.id,
    required this.image
  });
}
