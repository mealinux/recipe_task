import 'package:flutter/material.dart';
import 'package:recipe_task/constants/constants.dart';
import 'package:recipe_task/models/recipe_model.dart';

class Recipe extends StatelessWidget {
  final RecipeModel recipe;
  final bool isDetail;

  Recipe({required this.recipe, this.isDetail = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS_SIZE),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(CONSTANT.BORDER_RADIUS_SIZE)),
            child: Image(
              width: 100.0,
              image: NetworkImage(recipe.thumbnail.toString()),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(child: Text(recipe.name.toString())),
        ],
      ),
    );
  }
}
