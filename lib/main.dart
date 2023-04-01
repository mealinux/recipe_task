import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_task/database/recipe_box.dart';
import 'package:recipe_task/database/ingredients_box.dart';
import 'package:recipe_task/routes/pages.dart';
import 'package:recipe_task/routes/routes_callback.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_task/services/filter_service.dart';
import 'package:recipe_task/utils/filter_bottomsheet.dart';

void main() async {
  await initServices();

  runApp(const Main());
}

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(IngredientsBoxAdapter());
  Hive.registerAdapter(RecipeBoxAdapter());

  await GetStorage.init();

  Get.put(FilterService());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      routingCallback: (Routing? routing) {
        RoutingCallback().listenRoutes(routing: routing);
      },
      getPages: Pages.routes,
    );
  }
}
