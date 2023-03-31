import 'package:get/get.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/routes/pages.dart';

class RoutingCallback {
  FavoritesController? favoriteController;

  listenRoutes({Routing? routing}) {
    if (routing?.current == Routes.FAVORITES) {
      if (!Get.isRegistered<FavoritesController>()) {
        Get.lazyPut(() => FavoritesController());
      }
      favoriteController = Get.find<FavoritesController>();
      favoriteController!.getFavorites();
      return;
    }
  }
}
