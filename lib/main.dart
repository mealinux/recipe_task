import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_task/bindings/home_binding.dart';
import 'package:recipe_task/bindings/favorites_binding.dart';
import 'package:recipe_task/bindings/recipe_detail_binding.dart';
import 'package:recipe_task/database/favorite.dart';
import 'package:recipe_task/database/ingredients.dart';
import 'package:recipe_task/views/favorites_view.dart';
import 'package:recipe_task/views/home_view.dart';
import 'package:recipe_task/views/recipe_detail_view.dart';

void main() async {
  await installServices();

  runApp(const Main());
}

installServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(IngredientsAdapter());
  Hive.registerAdapter(FavoriteAdapter());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
          binding: HomeBinding(),
          transition: Transition.rightToLeftWithFade,
          children: [
            GetPage(
              name: '/recipe-detail',
              page: () => RecipeDetailView(),
              binding: RecipeDetailBinding(),
              transition: Transition.rightToLeftWithFade,
            ),
          ],
        ),
        GetPage(
          name: '/favorites',
          page: () => FavoritesView(),
          binding: FavoritesBinding(),
          transition: Transition.noTransition,
        ),
      ],
    );
  }
}
