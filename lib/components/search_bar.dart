import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/controllers/home_controller.dart';

class SearchBar extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return controller.lineLoading()
              ? LinearProgressIndicator(color: Colors.deepOrangeAccent.shade100)
              : Container();
        }),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0.0, 0.2),
                ),
              ],
            ),
            child: TextField(
              controller: controller.textFieldController,
              autofocus: false,
              onChanged: (value) async {
                if (value.length < 2) {
                  controller.lineLoading.value = false;
                }
              },
              onSubmitted: (value) async {
                await controller.searchRecipes(value);
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: 'Search recipes',
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
