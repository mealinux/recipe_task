import 'package:get/get.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/utils/helper_util.dart';
import 'package:recipe_task/models/recipe_model.dart';

class RecipeDetailController extends GetxController with HelperUtil {
  var recipe = RecipeModel().obs;

  FavoritesController? favoriteController;

  @override
  void onInit() {
    super.onInit();

    Get.lazyPut(() => FavoritesController());

    favoriteController = Get.find<FavoritesController>();

    getRecipeDetail(Get.arguments);
  }

  getRecipeDetail(RecipeModel paramRecipe) {
    recipe.value = paramRecipe;

    circleLoading.value = false;

    favoriteController?.checkFavorite(recipe().name.toString());
  }

  getIsFavorite() {
    return favoriteController?.isFavorite();
  }

  setFavoriteAdd(RecipeModel recipe) async {
    await favoriteController?.addFavorite(recipe);
  }
}
