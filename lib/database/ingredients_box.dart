import 'package:hive/hive.dart';

part 'ingredients_box.g.dart';

@HiveType(typeId: 1)
class IngredientsBox extends HiveObject {
  @HiveField(0)
  String? text;

  @HiveField(1)
  double? quantity;

  @HiveField(2)
  String? measure;

  @HiveField(3)
  String? food;

  @HiveField(4)
  double? weight;

  @HiveField(5)
  String? foodCategory;

  @HiveField(6)
  String? foodId;

  @HiveField(7)
  String? image;
}
