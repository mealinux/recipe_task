import 'package:recipe_task/database/ingredients_box.dart';

class IngredientsModel {
  final String? text;
  final double? quantity;
  final String? measure;
  final String? food;
  final double? weight;
  final String? foodCategory;
  final String? foodId;
  final String? image;

  IngredientsModel({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      IngredientsModel(
        text: json['text'],
        quantity: json['quantity'],
        measure: json['measure'],
        food: json['food'],
        weight: json['weight'],
        foodCategory: json['foodCategory'],
        foodId: json['foodId'],
        image: json['image'],
      );

  factory IngredientsModel.from(IngredientsBox ingredientsBox) =>
      IngredientsModel(
        text: ingredientsBox.text,
        quantity: ingredientsBox.quantity,
        measure: ingredientsBox.measure,
        food: ingredientsBox.food,
        weight: ingredientsBox.weight,
        foodCategory: ingredientsBox.foodCategory,
        foodId: ingredientsBox.foodId,
        image: ingredientsBox.image,
      );
}
