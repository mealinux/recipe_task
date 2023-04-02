import 'dart:math';

import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:recipe_task/services/api_service.dart';
import 'package:recipe_task/utils/helper_util.dart';

class RandomRecipeController extends GetxController
    with HelperUtil, ApiService {
  late RecipeDetailController recipeDetailController;
  late FavoritesController favoriteController;

  @override
  void onInit() {
    super.onInit();

    if (!Get.isRegistered<FavoritesController>()) {
      Get.lazyPut(() => FavoritesController());
    }

    favoriteController = Get.find<FavoritesController>();

    if (!Get.isRegistered<RecipeDetailController>()) {
      Get.lazyPut(() => RecipeDetailController());
    }

    recipeDetailController = Get.find<RecipeDetailController>();

    getRandom();
  }

  getRandom() async {
    lineLoading.value = true;

    var randomNum = Random().nextInt(10);

    var response = await httpGet(random_url: CONSTANT.RANDOM_URL_QUERY);

    var recipe = RecipeModel.fromJson(response['hits'][randomNum]['recipe']);

    recipeDetailController.recipe.value = recipe;
    favoriteController.checkFavorite(recipe.name.toString());

    if (Get.currentRoute != Routes.RANDOM_RECIPE) {
      Get.offAndToNamed(Routes.RANDOM_RECIPE);
    }

    lineLoading.value = false;
  }
}
