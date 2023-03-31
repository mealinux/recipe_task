import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin HelperUtil on GetxController {
  var lineLoading = false.obs;
  var circleLoading = false.obs;

  Widget dotMark = Container(
    height: 8.0,
    width: 8.0,
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(15.0),
    ),
  );
}
