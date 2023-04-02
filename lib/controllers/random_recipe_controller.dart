import 'dart:math';

import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:recipe_task/services/api_service.dart';
import 'package:recipe_task/utils/helper_util.dart';

class RandomRecipeController extends GetxController
    with HelperUtil, ApiService {
  @override
  void onInit() {
    super.onInit();

    if (!Get.isRegistered<RecipeDetailController>()) {
      Get.lazyPut(() => RecipeDetailController());
    }

    getRandom();
  }

  getRandom() async {
    lineLoading.value = true;

    var randomNum = Random();

    var response = await httpGet(random_url: CONSTANT.RANDOM_URL_QUERY);

    var recipe =
        RecipeModel.fromJson(response['hits'][randomNum.nextInt(10)]['recipe']);

    Get.offAndToNamed(Routes.RANDOM_RECIPE, arguments: recipe);

    lineLoading.value = false;
  }
}
