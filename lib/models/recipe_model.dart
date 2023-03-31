import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/models/ingredients_model.dart';

class RecipeModel {
  final String? name;
  final List<IngredientsModel>? ingredients;
  final List<dynamic>? instructions;
  final String? thumbnail;
  final String? cover;

  RecipeModel({
    this.name,
    this.ingredients,
    this.instructions,
    this.thumbnail,
    this.cover,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        name: json['label'],
        ingredients: json["ingredients"] != null
            ? List<IngredientsModel>.from(json["ingredients"].map(
                (x) => IngredientsModel.fromJson(x),
              ))
            : null,
        instructions: json["ingredientLines"],
        thumbnail:
            json['images']['THUMBNAIL']['url'] ?? CONSTANT.NO_PREVIEW_IMAGE,
        cover: json['image'] ?? CONSTANT.NO_PREVIEW_IMAGE,
      );
}
