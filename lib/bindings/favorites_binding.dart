import 'package:get/get.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';

class FavoritesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController());
  }
}
