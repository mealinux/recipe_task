import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/database/favorite.dart';
import 'package:recipe_task/models/recipe_model.dart';

mixin Repo on GetxController {
  FavoritesController? favoritesController;

  @override
  void onInit() {
    super.onInit();
  }

  repoDB() async {
    return await Hive.openBox('favorites');
  }

  /* repoGetAll() async {
    return box;
  } */

  repoCheck(String recipeName) async {
    Box box = await repoDB();

    return box.containsKey(recipeName);
  }

  repoAdd(Favorite recipe) async {
    Box box = await repoDB();

    await box.put(recipe.name, recipe);
  }

  repoDelete(int index) async {
    Box box = await repoDB();

    RecipeModel recipe = await box.getAt(index);

    await box.delete(recipe.name);

    Get.snackbar('Success', 'The recipe deleted',
        colorText: Colors.lightGreen.shade800);
  }
}
