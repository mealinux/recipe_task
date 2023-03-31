import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/utils/helper_util.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/services/api_service.dart';

class HomeController extends GetxController with HelperUtil {
  List<RecipeModel> recipes = <RecipeModel>[].obs;
  var apiService = ApiService();

  late TextEditingController textFieldController =
      TextEditingController(text: '');

  searchRecipes(String searchText) async {
    lineLoading.value = true;
    var response = await apiService.get(query: searchText);

    var data = response['hits']
        .map<RecipeModel>((data) => RecipeModel.fromJson(data['recipe']))
        .toList();

    recipes.clear();
    recipes.addAll(data);

    lineLoading.value = false;
  }
}
