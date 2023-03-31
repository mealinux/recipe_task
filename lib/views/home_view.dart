import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/components/search_bar.dart';
import 'package:recipe_task/controllers/home_controller.dart';
import 'package:recipe_task/views/recipe_list_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.09),
          child: SearchBar(),
        ),
        body: RecipeListView(),
        bottomNavigationBar: CustomNavigationBar(index: 0),
      ),
    );
  }
}
