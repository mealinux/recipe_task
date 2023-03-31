import 'package:hive/hive.dart';
import 'package:recipe_task/database/ingredients.dart';
import 'package:recipe_task/models/ingredients_model.dart';

part 'favorite.g.dart';

@HiveType(typeId: 0)
class Favorite extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  List<Ingredients>? ingredients;

  @HiveField(2)
  List<dynamic>? instructions;

  @HiveField(3)
  String? thumbnail;

  @HiveField(4)
  String? cover;
}
