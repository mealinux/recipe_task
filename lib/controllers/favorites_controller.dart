import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/database/ingredients_box.dart';
import 'package:recipe_task/database/recipe_box.dart';
import 'package:recipe_task/repositories/repository.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/utils/helper_util.dart';

class FavoritesController extends GetxController with HelperUtil, Repo {
  var isFavorite = false.obs;

  var favorites = <RecipeBox>[].obs;

  @override
  void onInit() {
    super.onInit();

    getFavorites();
  }

  getFavorites() async {
    var all = await repoGetAll();

    favorites.value = List<RecipeBox>.from(all);

    favorites.refresh();
  }

  deleteFavorite(int index) async {
    await repoDelete(index);

    await getFavorites();

    Get.snackbar('Success', 'The recipe deleted',
        colorText: Colors.lightGreen.shade800);
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
    List<IngredientsBox> ingredients = <IngredientsBox>[];

    recipe.ingredients?.forEach((e) {
      ingredients.add(
        IngredientsBox()
          ..text = e.text
          ..food = e.food
          ..foodCategory = e.foodCategory
          ..image = e.image
          ..measure = e.measure
          ..quantity = e.quantity
          ..weight = e.weight,
      );
    });

    RecipeBox favorite = RecipeBox()
      ..name = recipe.name
      ..ingredients = ingredients
      ..instructions = recipe.instructions as dynamic
      ..thumbnail = recipe.thumbnail
      ..cover = recipe.cover
      ..link = recipe.link;

    return favorite;
  }
}
