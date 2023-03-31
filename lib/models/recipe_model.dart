import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/database/recipe_box.dart';
import 'package:recipe_task/models/ingredients_model.dart';

class RecipeModel {
  final String? name;
  final List<IngredientsModel>? ingredients;
  final List<dynamic>? instructions;
  final String? thumbnail;
  final String? cover;
  final String? link;

  RecipeModel({
    this.name,
    this.ingredients,
    this.instructions,
    this.thumbnail,
    this.cover,
    this.link,
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
        link: json['url'],
      );

  factory RecipeModel.from(RecipeBox recipe) => RecipeModel(
        name: recipe.name,
        ingredients: List<IngredientsModel>.from(recipe.ingredients!.map(
          (x) => IngredientsModel.from(x),
        )),
        instructions: recipe.instructions,
        thumbnail: recipe.thumbnail,
        cover: recipe.cover,
        link: recipe.link,
      );
}
