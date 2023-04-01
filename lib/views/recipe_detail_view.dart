import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:share_plus/share_plus.dart';

class RecipeDetailView extends GetView<RecipeDetailController> {
  RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return controller.circleLoading()
            ? Container(
                color: CONSTANT.WHITE_COLOR,
                child: const SizedBox(
                  height: 50.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(controller.recipe().name!),
                  centerTitle: true,
                ),
                bottomNavigationBar: CustomNavigationBar(
                    pageIndex: 0,
                    onTap: (index) {
                      if (index == 0) {
                        Get.toNamed(Routes.HOME);
                      }

                      if (index == 1) {
                        Get.toNamed(Routes.FAVORITES);
                      }
                    }),
                body: ListView(
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(controller.recipe().cover.toString()),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Share.share(
                              'You can look below link to the recipe\n${controller.recipe().link}',
                              subject: 'Hey, I found delicious a recipe',
                            );
                          },
                          iconSize: 40.0,
                          icon: Icon(
                            Icons.share,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await controller
                                .setFavoriteAdd(controller.recipe());
                          },
                          icon: controller.getIsFavorite()
                              ? const Icon(Icons.favorite_rounded)
                              : const Icon(Icons.favorite_outline_rounded),
                          iconSize: 40.0,
                          color: CONSTANT.WARNING_COLOR,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CONSTANT.LIGHT_BLACK_COLOR,
                            blurRadius: 2.0,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(0.0, 0.2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ingredients',
                            style: TextStyle(
                                fontSize: CONSTANT.TITLE_TEXT_SIZE,
                                color: CONSTANT.TEXT_COLOR,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ListView.builder(
                            physics: const ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            shrinkWrap: true,
                            itemCount: controller.recipe().ingredients?.length,
                            itemBuilder: (context, index) {
                              var num = index + 1;
                              return Row(
                                children: [
                                  controller.dotMark,
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller
                                          .recipe()
                                          .ingredients![index]
                                          .text
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: CONSTANT.CONTENT_TEXT_SIZE,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CONSTANT.LIGHT_BLACK_COLOR,
                            blurRadius: 2.0,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(0.0, 0.2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Instructions',
                            style: TextStyle(
                              fontSize: CONSTANT.TITLE_TEXT_SIZE,
                              color: CONSTANT.TEXT_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ListView.builder(
                            physics: const ScrollPhysics(
                              parent: NeverScrollableScrollPhysics(),
                            ),
                            shrinkWrap: true,
                            itemCount: controller.recipe().instructions?.length,
                            itemBuilder: (context, index) {
                              var num = (index + 1).toString();
                              return Row(
                                children: [
                                  Text(
                                    '$num: ',
                                    style: const TextStyle(
                                      fontSize: CONSTANT.CONTENT_TEXT_SIZE,
                                      color: CONSTANT.TEXT_COLOR,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller
                                          .recipe()
                                          .instructions![index]
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: CONSTANT.CONTENT_TEXT_SIZE,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
