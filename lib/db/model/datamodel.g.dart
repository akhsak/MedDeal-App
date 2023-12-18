// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsModelAdapter extends TypeAdapter<ItemsModel> {
  @override
  final int typeId = 3;

  @override
  ItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsModel(
      name: fields[1] as String,
      num: fields[2] as String,
      item: fields[3] as String,
      price: fields[4] as String,
      id: fields[0] as int?,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.num)
      ..writeByte(3)
      ..write(obj.item)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
