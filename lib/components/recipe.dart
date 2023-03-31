import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_task/models/recipe_model.dart';

class Recipe extends StatelessWidget {
  final RecipeModel recipe;
  final bool isDetail;

  Recipe({required this.recipe, this.isDetail = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image(
            width: 100.0,
            image: NetworkImage(recipe.thumbnail.toString()),
          ),
          SizedBox(
            width: 10.0,
          ),
          Flexible(child: Text(recipe.name.toString())),
        ],
      ),
    );
  }
}
