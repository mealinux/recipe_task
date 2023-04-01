import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_task/controllers/home_controller.dart';

class CustomNavigationBar extends GetView<HomeController> {
  final int pageIndex;
  final ValueSetter<int>? onTap;

  CustomNavigationBar({required this.pageIndex, this.onTap});

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
      currentIndex: pageIndex,
      selectedItemColor: Colors.deepOrangeAccent.shade400,
      onTap: (index) => onTap?.call(index),
    );
  }
}
