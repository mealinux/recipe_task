part of 'pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;

  static const RECIPE_DETAIL = _Paths.RECIPE_DETAIL;
  static const FAVORITES = _Paths.FAVORITES;

  static const RANDOM_RECIPE = _Paths.RANDOM_RECIPE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/';

  static const RECIPE_DETAIL = '/recipe-detail';
  static const FAVORITES = '/favorites';

  static const RANDOM_RECIPE = '/random-recipe';
}
