import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/search_bar.dart';
import 'package:recipe_task/controllers/home_controller.dart';
import 'package:recipe_task/controllers/random_recipe_controller.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:recipe_task/utils/filter_bottomsheet.dart';
import 'package:recipe_task/views/recipe_list_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.4),
          child: SearchBar(
            onSubmitted: (value) async {
              await controller.searchRecipes(value);
            },
            onChanged: (value) async {
              if (value.length < 2) {
                controller.lineLoading.value = false;
              }
            },
            onTapHistory: (index) async {
              var text = controller.textFieldController.text =
                  controller.history[index];

              controller.focusNode.unfocus();
              await controller.searchRecipes(text);
            },
            onTapHistoryDelete: (index) {
              controller.deleteHistory(index);
            },
            focusNode: controller.focusNode,
            history: controller.history,
            filterService: controller.filterService,
            onTapFilter: () {
              Filter().filterBottomsheet();
              controller.focusNode.unfocus();
            },
          ),
        ),
        body: GestureDetector(
          onTap: () {
            controller.focusNode.unfocus();
          },
          child: RecipeListView(),
        ),
        bottomNavigationBar: CustomNavigationBar(
            pageIndex: 0,
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
            }),
      ),
    );
  }
}
