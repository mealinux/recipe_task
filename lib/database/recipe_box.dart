import 'package:hive/hive.dart';
import 'package:recipe_task/database/ingredients_box.dart';

part 'recipe_box.g.dart';

@HiveType(typeId: 0)
class RecipeBox extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  List<IngredientsBox>? ingredients;

  @HiveField(2)
  List<dynamic>? instructions;

  @HiveField(3)
  String? thumbnail;

  @HiveField(4)
  String? cover;

  @HiveField(5)
  String? link;
}
