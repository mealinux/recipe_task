import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/home_controller.dart';

class SearchBar extends GetView<HomeController> {
  final AsyncValueSetter<String>? onChanged;
  final AsyncValueSetter<String>? onSubmitted;
  final AsyncValueSetter? onTapHistory;
  final ValueSetter? onTapHistoryDelete;
  final VoidCallback? onTapFilter;

  final List<String>? history;
  final FocusNode? focusNode;
  final List? filters;

  SearchBar({
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.history,
    this.onTapHistory,
    this.onTapHistoryDelete,
    this.onTapFilter,
    this.filters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: history!.isNotEmpty && focusNode!.hasFocus
          ? Get.height * 0.4
          : Get.height * 0.1,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CONSTANT.LIGHT_BLACK_COLOR,
            blurRadius: 15.0,
            blurStyle: BlurStyle.outer,
            offset: Offset(0.0, 0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.07,
                  child: TextField(
                    controller: controller.textFieldController,
                    enableSuggestions: true,
                    focusNode: focusNode,
                    autofocus: false,
                    onChanged: (value) async => onChanged?.call(value),
                    onSubmitted: (value) async => onSubmitted?.call(value),
                    textInputAction: TextInputAction.search,
                    decoration: const InputDecoration(
                      labelText: 'Search recipes or ingredients',
                      fillColor: CONSTANT.WHITE_COLOR,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                if (history!.isNotEmpty && focusNode!.hasFocus)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: history!.length,
                        itemExtent: 35.0,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async =>
                                    await onTapHistory?.call(index),
                                child: Row(
                                  children: [
                                    const Icon(Icons.restore_rounded),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(history![index]),
                                  ],
                                ),
                              ),
                              IconButton(
                                  alignment: Alignment.centerRight,
                                  onPressed: () =>
                                      onTapHistoryDelete?.call(index),
                                  icon: const Icon(Icons.close_rounded)),
                            ],
                          );
                        },
                      ),
                    ),
                  )
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () => onTapFilter?.call(),
                icon: const Icon(Icons.filter_list_rounded),
                color: CONSTANT.TEXT_COLOR,
                iconSize: 35.0,
              ),
              if (filters!.isNotEmpty)
                Positioned(
                  right: 10.0,
                  top: 10.0,
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: CONSTANT.SUCCESS_COLOR,
                      borderRadius:
                          BorderRadius.circular(CONSTANT.BORDER_RADIUS_SIZE),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
