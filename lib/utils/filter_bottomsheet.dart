import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/home_controller.dart';
import 'package:recipe_task/services/api_service.dart';
import 'package:recipe_task/services/filter_service.dart';

class Filter extends GetxController with ApiService {
  filterBottomsheet() {
    var filterService = Get.find<FilterService>();

    filterService.getFilters();

    return Get.bottomSheet(
      SizedBox(
        height: Get.height * 0.5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Filters'),
            toolbarHeight: 40.0,
            backgroundColor: CONSTANT.APPBAR_COLOR,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close_rounded),
              ),
              IconButton(
                onPressed: () async {
                  var homeController = Get.find<HomeController>();

                  var text = homeController.textFieldController.text;

                  if (text.length > 2) {
                    Get.back();
                    await homeController.searchRecipes(text);
                  }
                },
                icon: const Icon(Icons.search_rounded),
              ),
            ],
          ),
          body: Center(
            child: SizedBox(
                width: Get.width * 0.7,
                height: Get.height * 0.5,
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 125.0,
                            height: 75.0,
                            child: ElevatedButton(
                              onPressed: () {
                                filterService.addFilter('gluten-free');
                              },
                              child: const Text('Gluten-free'),
                              style: ButtonStyle(
                                backgroundColor: filterService.filters
                                        .contains('gluten-free')
                                    ? MaterialStatePropertyAll(
                                        Colors.green.shade700)
                                    : const MaterialStatePropertyAll(
                                        Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 125.0,
                            height: 75.0,
                            child: ElevatedButton(
                              onPressed: () {
                                filterService.addFilter('alcohol-free');
                              },
                              child: const Text('Alcohol-free'),
                              style: ButtonStyle(
                                backgroundColor: filterService.filters
                                        .contains('alcohol-free')
                                    ? MaterialStatePropertyAll(
                                        Colors.green.shade700)
                                    : const MaterialStatePropertyAll(
                                        Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 125.0,
                            height: 75.0,
                            child: ElevatedButton(
                              onPressed: () {
                                filterService.addFilter('low-sugar');
                              },
                              child: const Text('Low-sugar'),
                              style: ButtonStyle(
                                backgroundColor:
                                    filterService.filters.contains('low-sugar')
                                        ? MaterialStatePropertyAll(
                                            Colors.green.shade700)
                                        : const MaterialStatePropertyAll(
                                            Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 125.0,
                            height: 75.0,
                            child: ElevatedButton(
                              onPressed: () {
                                filterService.addFilter('vegan');
                              },
                              child: const Text('Vegan'),
                              style: ButtonStyle(
                                backgroundColor:
                                    filterService.filters.contains('vegan')
                                        ? MaterialStatePropertyAll(
                                            Colors.green.shade700)
                                        : const MaterialStatePropertyAll(
                                            Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                })),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: true,
    );
  }
}
