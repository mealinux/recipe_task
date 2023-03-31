import 'package:get/get.dart';
import 'package:recipe_task/bindings/favorites_binding.dart';
import 'package:recipe_task/bindings/home_binding.dart';
import 'package:recipe_task/bindings/recipe_detail_binding.dart';
import 'package:recipe_task/views/favorites_view.dart';
import 'package:recipe_task/views/home_view.dart';
import 'package:recipe_task/views/recipe_detail_view.dart';

part 'routes.dart';

class Pages {
  Pages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      children: [
        GetPage(
          name: Routes.RECIPE_DETAIL,
          page: () => RecipeDetailView(),
          binding: RecipeDetailBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
    ),
    GetPage(
      name: Routes.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
