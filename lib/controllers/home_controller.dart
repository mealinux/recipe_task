import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/services/filter_service.dart';
import 'package:recipe_task/services/history_service.dart';
import 'package:recipe_task/utils/helper_util.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/services/api_service.dart';

class HomeController extends GetxController with HelperUtil, ApiService {
  List<RecipeModel> recipes = <RecipeModel>[].obs;

  late TextEditingController textFieldController =
      TextEditingController(text: '');

  List<String> history = <String>[].obs;

  var focusNode = FocusNode();

  var historyService = Get.find<HistoryService>();

  var filterService = Get.find<FilterService>();

  @override
  onInit() {
    super.onInit();

    focusNode.addListener(onFocus);

    filterService.getFilters();
  }

  void onFocus() {
    if (focusNode.hasFocus) {
      List<String> allHistory = List<String>.from(historyService.getHistory());

      history.addAll(allHistory);
    } else {
      history.clear();
    }
  }

  searchRecipes(String searchText) async {
    lineLoading.value = true;

    var filtersText = filterService.filterQueryText();

    var response = await httpGet(query: searchText, filters: filtersText);

    var data = response['hits']
        .map<RecipeModel>((data) => RecipeModel.fromJson(data['recipe']))
        .toList();

    recipes.clear();
    recipes.addAll(data);

    saveHistory(searchText);

    lineLoading.value = false;
  }

  saveHistory(String text) {
    historyService.addHistory(text);
  }

  deleteHistory(int index) {
    historyService.deleteHistory(index);

    history.removeAt(index);
  }

  getHistory() {
    history.add(historyService.getHistory());
  }
}
