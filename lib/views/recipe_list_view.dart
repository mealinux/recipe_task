import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/recipe.dart';
import 'package:recipe_task/controllers/home_controller.dart';

class RecipeListView extends GetView<HomeController> {
  RecipeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return controller.recipes.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 100.0,
                    ),
                    itemCount: controller.recipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/recipe-detail',
                              arguments: controller.recipes[index]);
                          controller.circleLoading.value = true;
                        },
                        child: Recipe(
                          recipe: controller.recipes[index],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('No recipes'),
                  );
          }),
        ),
      ),
    );
  }
}
