import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';

mixin HelperUtil on GetxController {
  var lineLoading = false.obs;
  var circleLoading = false.obs;

  var keyboardHeight = Get.mediaQuery.viewInsets.bottom.obs;

  Widget dotMark = Container(
    height: 8.0,
    width: 8.0,
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS_SIZE),
    ),
  );
}
