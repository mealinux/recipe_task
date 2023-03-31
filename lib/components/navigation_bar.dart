import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/controllers/home_controller.dart';

class CustomNavigationBar extends GetView<HomeController> {
  final int index;

  CustomNavigationBar({required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: 'My Favorites',
        ),
      ],
      currentIndex: index,
      selectedItemColor: Colors.deepOrangeAccent.shade400,
      onTap: (value) {
        if (value == 0 &&
            (index != 0 || Get.currentRoute == '/recipe-detail')) {
          Get.offAndToNamed('/');
        }

        if (value == 1 && index != 1) {
          Get.toNamed('/favorites');
        }
      },
    );
  }
}
