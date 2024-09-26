import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final dynamic message;

  const ErrorMessageModel({
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    dynamic parsedMessage = json["message"];

    // Check if the parsed message is a list, if not, convert it to a list of strings
    if (parsedMessage is List) {
      return ErrorMessageModel(message: List<String>.from(parsedMessage));
    } else {
      return ErrorMessageModel(message: parsedMessage.toString());
    }
  }

  @override
  List<Object?> get props => [
        message,
      ];
}
