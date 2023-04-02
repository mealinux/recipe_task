import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/recipe.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/controllers/random_recipe_controller.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class FavoritesView extends GetView<FavoritesController> {
  FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
          centerTitle: true,
          backgroundColor: CONSTANT.APPBAR_COLOR,
          toolbarHeight: CONSTANT.TOOLBAR_HEIGHT,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return controller.favorites().isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 100.0,
                    ),
                    itemCount: controller.favorites().length,
                    itemBuilder: (BuildContext context, int index) {
                      var recipeModel =
                          RecipeModel.from(controller.favorites()[index]);
                      return InkWell(
                        onTap: () {
                          var recipe =
                              RecipeModel.from(controller.favorites()[index]);

                          if (!Get.isRegistered<RecipeDetailController>()) {
                            Get.lazyPut(() => RecipeDetailController());
                          }

                          var recipeDetailController =
                              Get.find<RecipeDetailController>();

                          recipeDetailController.getRecipeDetail(recipe);

                          controller.circleLoading.value = true;
                        },
                        child: SwipeableTile.card(
                          color: CONSTANT.WHITE_COLOR,
                          shadow: const BoxShadow(blurRadius: 0),
                          horizontalPadding: 0,
                          verticalPadding: 0,
                          direction: SwipeDirection.horizontal,
                          onSwiped: (direction) async {
                            controller.favorites().removeAt(index);
                            await controller.deleteFavorite(index);
                          },
                          backgroundBuilder: (context, direction, progress) {
                            return AnimatedBuilder(
                              animation: progress,
                              builder: (context, child) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  color: CONSTANT.WARNING_COLOR,
                                );
                              },
                            );
                          },
                          key: UniqueKey(),
                          child: Recipe(recipe: recipeModel),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('No recipes'),
                  );
          }),
        ),
        bottomNavigationBar: CustomNavigationBar(
          pageIndex: 1,
          onTap: (index) async {
            if (index == 0) {
              Get.toNamed(Routes.HOME);
            }

            if (index == 1) {
              if (!Get.isRegistered<RandomRecipeController>()) {
                Get.lazyPut(() => RandomRecipeController());
              }

              var randomRecipeController = Get.find<RandomRecipeController>();

              await randomRecipeController.getRandom();
            }

            if (index == 2) {
              Get.offAndToNamed(Routes.FAVORITES);
            }
          },
        ),
      ),
    );
  }
}
