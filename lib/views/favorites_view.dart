import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/recipe.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';
import 'package:recipe_task/models/recipe_model.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class FavoritesView extends GetView<FavoritesController> {
  FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Favorites'),
          centerTitle: true,
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
                          Get.toNamed('/recipe-detail', arguments: recipeModel);
                          controller.circleLoading.value = true;
                        },
                        child: SwipeableTile.card(
                          color: Colors.white,
                          shadow: BoxShadow(blurRadius: 0),
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
                                  color: Colors.red.shade400,
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
                : Center(
                    child: Text('No recipes'),
                  );
          }),
        ),
        bottomNavigationBar: CustomNavigationBar(index: 1),
      ),
    );
  }
}
