import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/controllers/favorites_controller.dart';

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
        body: Text('asdfsdf'),
        bottomNavigationBar: CustomNavigationBar(index: 1),
      ),
    );
  }
}
