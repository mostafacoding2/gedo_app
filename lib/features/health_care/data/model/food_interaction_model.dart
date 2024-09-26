class FoodInteractionModel {
  final String? message;



  FoodInteractionModel({
    this.message,
  });

  factory FoodInteractionModel.fromJson(Map<String, dynamic> json) {
    return FoodInteractionModel(
      message: json['message'] as String?,

    );
  }
}
