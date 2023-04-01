import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/search_bar.dart';
import 'package:recipe_task/controllers/home_controller.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:recipe_task/views/recipe_list_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.09),
          child: SearchBar(
            onSubmitted: (value) async {
              await controller.searchRecipes(value);
            },
            onChanged: (value) async {
              if (value.length < 2) {
                controller.lineLoading.value = false;
              }
            },
          ),
        ),
        body: RecipeListView(),
        bottomNavigationBar: CustomNavigationBar(
            pageIndex: 0,
            onTap: (index) {
              if (index == 0) {
                Get.toNamed(Routes.HOME);
              }

              if (index == 1) {
                Get.toNamed(Routes.FAVORITES);
              }
            }),
      ),
    );
  }
}
