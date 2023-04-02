import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';
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

    Get.snackbar(
      CONSTANT.SUCCESS_TITLE,
      CONSTANT.SUCCESS_DELETED_MESSAGE,
      colorText: CONSTANT.SUCCESS_COLOR,
      backgroundColor: CONSTANT.ALERT_COLOR,
    );
  }

  addFavorite(RecipeModel recipe) async {
    final favorite = prepareRecipeForHive(recipe);

    if (await repoCheck(recipe.name.toString())) {
      Get.snackbar(
        CONSTANT.WARNING_TITLE,
        CONSTANT.WARNING_MESSAGE,
        colorText: CONSTANT.WARNING_COLOR,
        backgroundColor: CONSTANT.ALERT_COLOR,
      );
      return;
    }

    await repoAdd(favorite);

    Get.snackbar(
      CONSTANT.SUCCESS_TITLE,
      CONSTANT.SUCCESS_ADDED_MESSAGE,
      colorText: CONSTANT.SUCCESS_COLOR,
      backgroundColor: CONSTANT.ALERT_COLOR,
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
