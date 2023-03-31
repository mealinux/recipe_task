import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/utils/helper_util.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/services/api_service.dart';
import 'package:recipe_task/utils/search_history.dart';

class HomeController extends GetxController with HelperUtil {
  List<RecipeModel> recipes = <RecipeModel>[].obs;
  var apiService = ApiService();

  late TextEditingController textFieldController =
      TextEditingController(text: '');

  List<String> history = <String>[].obs;

  searchRecipes(String searchText) async {
    lineLoading.value = true;
    var response = await apiService.get(query: searchText);

    var data = response['hits']
        .map<RecipeModel>((data) => RecipeModel.fromJson(data['recipe']))
        .toList();

    recipes.clear();
    recipes.addAll(data);

    /*  historyEvent(searchText); */

    lineLoading.value = false;
  }

  /* historyEvent(String text) {
    if (!Get.isRegistered<SearchHistory>()) {
      Get.lazyPut(() => SearchHistory());
    }

    var searchHistory = Get.find<SearchHistory>();

    searchHistory.addHistory(text);

    var texts = searchHistory.getHistory();

    print(texts);
  } */
}
