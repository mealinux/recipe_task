import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/controllers/random_recipe_controller.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:recipe_task/views/recipe_detail_view.dart';

class RandomRecipeView extends GetView<RandomRecipeController> {
  RandomRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RecipeDetailView(showNavigatorbar: false),
        bottomNavigationBar: CustomNavigationBar(
            pageIndex: 1,
            onTap: (index) async {
              if (index == 0) {
                Get.toNamed(Routes.HOME);
              }

              if (index == 1) {
                await controller.getRandom();
              }

              if (index == 2) {
                Get.offAndToNamed(Routes.FAVORITES);
              }
            }),
      ),
    );
  }
}
