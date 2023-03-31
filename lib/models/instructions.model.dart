import 'dart:convert';

class InstructionsModel {
  final List<String>? instructions;

  InstructionsModel({
    this.instructions,
  });

  factory InstructionsModel.fromJson(Map<String, dynamic> json) =>
      InstructionsModel(
        instructions: jsonDecode(json['ingredientLines']),
      );
}
