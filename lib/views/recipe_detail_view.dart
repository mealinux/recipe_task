import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/controllers/recipe_detail_controller.dart';

class RecipeDetailView extends GetView<RecipeDetailController> {
  RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return controller.circleLoading()
            ? Container(
                color: Colors.white,
                child: SizedBox(
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
                bottomNavigationBar: CustomNavigationBar(index: 0),
                body: ListView(
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(controller.recipe().cover.toString()),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await controller
                                  .setFavoriteAdd(controller.recipe());
                            },
                            icon: controller.getIsFavorite()
                                ? Icon(Icons.favorite_rounded)
                                : Icon(Icons.favorite_outline_rounded),
                            iconSize: 40.0,
                            color: Colors.red.shade700,
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 2.0,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(0.0, 0.2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredients',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ListView.builder(
                            physics: ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            shrinkWrap: true,
                            itemCount: controller.recipe().ingredients?.length,
                            itemBuilder: (context, index) {
                              var num = index + 1;
                              return Row(
                                children: [
                                  controller.dotMark,
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller
                                          .recipe()
                                          .ingredients![index]
                                          .text
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
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
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 2.0,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(0.0, 0.2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Instructions',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ListView.builder(
                            physics: ScrollPhysics(
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
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      controller
                                          .recipe()
                                          .instructions![index]
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
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
