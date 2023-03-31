import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/database/recipe_box.dart';
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

  repoGetAll() async {
    Box box = await repoDB();

    return box.toMap().values.toList();
  }

  repoCheck(String recipeName) async {
    Box box = await repoDB();

    return box.containsKey(recipeName);
  }

  repoAdd(RecipeBox recipe) async {
    Box box = await repoDB();

    await box.put(recipe.name, recipe);
  }

  repoDelete(int index) async {
    Box box = await repoDB();

    var recipe = RecipeModel.from(await box.getAt(index));

    await box.delete(recipe.name);
  }
}
