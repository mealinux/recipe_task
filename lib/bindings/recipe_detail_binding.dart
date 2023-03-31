import 'package:get/get.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';

class RecipeDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecipeDetailController());
  }
}
