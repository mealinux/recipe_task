// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientsBoxAdapter extends TypeAdapter<IngredientsBox> {
  @override
  final int typeId = 1;

  @override
  IngredientsBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientsBox()
      ..text = fields[0] as String?
      ..quantity = fields[1] as double?
      ..measure = fields[2] as String?
      ..food = fields[3] as String?
      ..weight = fields[4] as double?
      ..foodCategory = fields[5] as String?
      ..foodId = fields[6] as String?
      ..image = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, IngredientsBox obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.measure)
      ..writeByte(3)
      ..write(obj.food)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.foodCategory)
      ..writeByte(6)
      ..write(obj.foodId)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
