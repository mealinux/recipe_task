import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_task/controllers/home_controller.dart';
import 'package:recipe_task/services/api_service.dart';

class Filter extends GetxController with ApiService {
  GetStorage filterStorage = GetStorage();

  var filters = [].obs;

  filterBottomsheet() {
    getFilters();

    return Get.bottomSheet(
      Container(
        height: Get.height * 0.5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Filters'),
            toolbarHeight: 40.0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close_rounded),
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
                icon: Icon(Icons.search_rounded),
              ),
            ],
          ),
          body: Center(
            child: Container(
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
                                addFilter('gluten-free');
                              },
                              child: Text('Gluten-free'),
                              style: ButtonStyle(
                                backgroundColor:
                                    filters().contains('gluten-free')
                                        ? MaterialStatePropertyAll(
                                            Colors.green.shade700)
                                        : MaterialStatePropertyAll(Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 125.0,
                            height: 75.0,
                            child: ElevatedButton(
                              onPressed: () {
                                addFilter('alcohol-free');
                              },
                              child: Text('Alcohol-free'),
                              style: ButtonStyle(
                                backgroundColor:
                                    filters().contains('alcohol-free')
                                        ? MaterialStatePropertyAll(
                                            Colors.green.shade700)
                                        : MaterialStatePropertyAll(Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
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
                                addFilter('low-sugar');
                              },
                              child: Text('Low-sugar'),
                              style: ButtonStyle(
                                backgroundColor: filters().contains('low-sugar')
                                    ? MaterialStatePropertyAll(
                                        Colors.green.shade700)
                                    : MaterialStatePropertyAll(Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 125.0,
                            height: 75.0,
                            child: ElevatedButton(
                              onPressed: () {
                                addFilter('vegan');
                              },
                              child: Text('Vegan'),
                              style: ButtonStyle(
                                backgroundColor: filters().contains('vegan')
                                    ? MaterialStatePropertyAll(
                                        Colors.green.shade700)
                                    : MaterialStatePropertyAll(Colors.grey),
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

  getFilters() {
    var filterTexts = filterStorage.read('filters') ?? [];

    filters.value = filterTexts;
    filters.refresh();
  }

  addFilter(String text) {
    getFilters();

    if (filters().contains(text)) {
      filters().remove(text);
    } else {
      filters().add(text);
    }

    filterStorage.write('filters', filters());

    filters.refresh();
  }

  filterText() {
    getFilters();

    var filterText = '';
    filters().forEach((element) {
      filterText += 'health=$element&';
    });

    return filterText;
  }
}
