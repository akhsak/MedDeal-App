import 'package:hive/hive.dart';
  part 'datamodel.g.dart';

@HiveType(typeId: 3)
class ItemsModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String num;

  @HiveField(2)
  final String item;

  @HiveField(3)
  final String price;
  //final String? image;

  ItemsModel({
    required this.name,
    required this.num,
    required this.item,
    required this.price,
    //required this.image
  });
}
