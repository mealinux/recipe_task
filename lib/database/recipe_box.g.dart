// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeBoxAdapter extends TypeAdapter<RecipeBox> {
  @override
  final int typeId = 0;

  @override
  RecipeBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeBox()
      ..name = fields[0] as String?
      ..ingredients = (fields[1] as List?)?.cast<IngredientsBox>()
      ..instructions = (fields[2] as List?)?.cast<dynamic>()
      ..thumbnail = fields[3] as String?
      ..cover = fields[4] as String?
      ..link = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, RecipeBox obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ingredients)
      ..writeByte(2)
      ..write(obj.instructions)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.cover)
      ..writeByte(5)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
