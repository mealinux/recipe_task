import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputHistoryTextField(
                      historyKey: '01',
                      showDeleteIcon: true,
                      deleteIcon: Icons.delete,
                      deleteIconColor: Colors.red.shade500,
                      textEditingController: controller.textFieldController,
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
                      decoration: const InputDecoration(
                        labelText: 'Search recipes',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(Icons.filter_list_rounded),
                    iconSize: 35.0,
                  )
                ],
              )),
        ),
      ],
    );
  }
}
