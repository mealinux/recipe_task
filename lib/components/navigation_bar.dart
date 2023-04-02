import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/home_controller.dart';

class CustomNavigationBar extends GetView<HomeController> {
  final int pageIndex;
  final AsyncValueSetter<int>? onTap;

  CustomNavigationBar({required this.pageIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CONSTANT.LIGHT_BLACK_COLOR, width: 2.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: const Icon(Icons.question_mark_rounded),
          ),
          label: 'Get Random',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: 'My Favorites',
        ),
      ],
      backgroundColor: CONSTANT.NAVIGATOR_COLOR,
      currentIndex: pageIndex,
      selectedItemColor: CONSTANT.ALERT_COLOR,
      onTap: (index) async => await onTap?.call(index),
    );
  }
}
