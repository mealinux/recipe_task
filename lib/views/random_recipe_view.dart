import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/recipe_detail.dart';
import 'package:recipe_task/controllers/random_recipe_controller.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:share_plus/share_plus.dart';

class RandomRecipeView extends GetView {
  RandomRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<RandomRecipeController>()) {
      Get.lazyPut(() => RandomRecipeController());
    }

    var randomController = Get.find<RandomRecipeController>();

    return SafeArea(
      child: Obx(() {
        return Column(
          children: [
            randomController.lineLoading()
                ? LinearProgressIndicator(
                    color: Colors.deepOrangeAccent.shade100)
                : Container(),
            Expanded(
              child: Scaffold(
                  body: RecipeDetail(
                recipe: randomController.recipeDetailController.recipe(),
                getBack: false,
                dotMark: randomController.dotMark,
                onTapShare: () {
                  Share.share(
                    'You can look below link to the recipe\n${randomController.recipeDetailController.recipe().link}',
                    subject: 'Hey, I found delicious a recipe',
                  );
                },
                onTapAddFavorite: () async {
                  await randomController.recipeDetailController.setFavoriteAdd(
                      randomController.recipeDetailController.recipe());
                },
                addFavoriteIcon:
                    randomController.recipeDetailController.getIsFavorite()
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(Icons.favorite_outline_rounded),
                customNavigationBar: CustomNavigationBar(
                  pageIndex: 1,
                  onTap: (index) async {
                    if (index == 0) {
                      Get.toNamed(Routes.HOME);
                    }

                    if (index == 1) {
                      await randomController.getRandom();
                    }

                    if (index == 2) {
                      Get.offAndToNamed(Routes.FAVORITES);
                    }
                  },
                ),
              )),
            ),
          ],
        );
      }),
    );
  }
}
