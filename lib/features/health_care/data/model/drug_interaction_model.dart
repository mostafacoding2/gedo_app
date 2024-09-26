

class DrugInteractionModel {
  final String? message;


  DrugInteractionModel({
    this.message,

  });

  factory DrugInteractionModel.fromJson(Map<String, dynamic> json) {
    return DrugInteractionModel(
      message: json['result'] ?? json['message']as String?,

    );
  }
//
}
