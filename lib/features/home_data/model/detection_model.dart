class DetectionModel
{
  final String detectionMessage;
  final String? detectionTitle;


  DetectionModel( {required this.detectionMessage , required this.detectionTitle});

  factory DetectionModel.fromJson(Map<String, dynamic> json) {
    return DetectionModel(
      detectionMessage: json["message"],
      detectionTitle: json["prediction"],
    );
  }
//
}