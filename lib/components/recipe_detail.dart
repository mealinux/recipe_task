import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_task/components/navigation_bar.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/models/recipe_model.dart';

class RecipeDetail extends StatelessWidget {
  final CustomNavigationBar customNavigationBar;
  final RecipeModel recipe;
  final Widget? dotMark;
  final VoidCallback? onTapShare;
  final AsyncCallback? onTapAddFavorite;
  final Widget? addFavoriteIcon;
  final bool getBack;

  RecipeDetail({
    required this.recipe,
    this.getBack = true,
    this.dotMark,
    required this.customNavigationBar,
    this.onTapShare,
    this.onTapAddFavorite,
    this.addFavoriteIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name!),
        centerTitle: true,
        backgroundColor: CONSTANT.APPBAR_COLOR,
        toolbarHeight: CONSTANT.TOOLBAR_HEIGHT,
        automaticallyImplyLeading: getBack,
      ),
      bottomNavigationBar: customNavigationBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(CONSTANT.BORDER_RADIUS_SIZE)),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  recipe.cover.toString(),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => onTapShare?.call(),
                  iconSize: 40.0,
                  icon: Icon(
                    Icons.share,
                    color: Colors.grey.shade800,
                  ),
                ),
                IconButton(
                  onPressed: () async => await onTapAddFavorite?.call(),
                  icon: addFavoriteIcon!,
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
                borderRadius: BorderRadius.all(
                    Radius.circular(CONSTANT.BORDER_RADIUS_SIZE)),
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
                    itemCount: recipe.ingredients?.length,
                    itemBuilder: (context, index) {
                      var num = index + 1;
                      return Row(
                        children: [
                          dotMark!,
                          const SizedBox(
                            width: 5.0,
                          ),
                          Flexible(
                            child: Text(
                              recipe.ingredients![index].text.toString(),
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
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(CONSTANT.BORDER_RADIUS_SIZE)),
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
                    itemCount: recipe.instructions?.length,
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
                              recipe.instructions![index].toString(),
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
      ),
    );
  }
}
