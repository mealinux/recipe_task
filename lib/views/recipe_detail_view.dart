import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/recipe_detail.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/random_recipe_controller.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:share_plus/share_plus.dart';

class RecipeDetailView extends GetView<RecipeDetailController> {
  RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return controller.circleLoading()
            ? Container(
                color: CONSTANT.WHITE_COLOR,
                child: const SizedBox(
                  height: 50.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : RecipeDetail(
                recipe: controller.recipe(),
                dotMark: controller.dotMark,
                onTapShare: () {
                  Share.share(
                    'You can look below link to the recipe\n${controller.recipe().link}',
                    subject: 'Hey, I found delicious a recipe',
                  );
                },
                onTapAddFavorite: () async {
                  await controller.setFavoriteAdd(controller.recipe());
                },
                addFavoriteIcon: controller.getIsFavorite()
                    ? const Icon(Icons.favorite_rounded)
                    : const Icon(Icons.favorite_outline_rounded),
                customNavigationBar: CustomNavigationBar(
                  pageIndex: 0,
                  onTap: (index) async {
                    if (index == 0) {
                      Get.offAndToNamed(Routes.HOME);
                    }

                    if (index == 1) {
                      if (!Get.isRegistered<RandomRecipeController>()) {
                        Get.lazyPut(() => RandomRecipeController());
                      }

                      var randomRecipeController =
                          Get.find<RandomRecipeController>();

                      await randomRecipeController.getRandom();
                    }

                    if (index == 2) {
                      Get.offAndToNamed(Routes.FAVORITES);
                    }
                  },
                ),
              );
      }),
    );
  }
}
