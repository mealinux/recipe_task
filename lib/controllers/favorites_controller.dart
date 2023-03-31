import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/bindings/repositories/repository.dart';
import 'package:recipe_task/database/favorite.dart';
import 'package:recipe_task/database/ingredients.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/utils/helper_util.dart';

class FavoritesController extends GetxController with HelperUtil, Repo {
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  addFavorite(RecipeModel recipe) async {
    final favorite = prepareRecipeForHive(recipe);

    if (await repoCheck(recipe.name.toString())) {
      Get.snackbar(
        'Warning',
        'The recipe already exists in your favorites',
        colorText: Colors.deepOrange.shade800,
        backgroundColor: Colors.white60,
      );
      return;
    }

    await repoAdd(favorite);

    Get.snackbar(
      'Success',
      'The recipe added your favorites',
      colorText: Colors.green.shade800,
      backgroundColor: Colors.white60,
    );

    await checkFavorite(recipe.name.toString());
  }

  checkFavorite(String recipeName) async {
    isFavorite.value = await repoCheck(recipeName);
  }

  prepareRecipeForHive(RecipeModel recipe) {
    List<Ingredients> ingredients = <Ingredients>[];

    recipe.ingredients?.forEach((e) {
      ingredients.add(
        Ingredients()
          ..text = e.text
          ..food = e.food
          ..foodCategory = e.foodCategory
          ..image = e.image
          ..measure = e.measure
          ..quantity = e.quantity
          ..weight = e.weight,
      );
    });

    Favorite favorite = Favorite()
      ..name = recipe.name
      ..ingredients = ingredients
      ..instructions = recipe.instructions as dynamic
      ..thumbnail = recipe.thumbnail
      ..cover = recipe.cover;

    return favorite;
  }
}
