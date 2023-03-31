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
}
