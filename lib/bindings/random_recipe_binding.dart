import 'package:get/get.dart';
import 'package:recipe_task/controllers/random_recipe_controller.dart';

class RandomRecipeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RandomRecipeController());
  }
}
