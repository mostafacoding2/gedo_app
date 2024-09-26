import 'package:equatable/equatable.dart';

class BoardingModel extends Equatable
{
  final String image;
  final String body;

  const BoardingModel({
    required this.image,
    required this.body,
  });

  @override
  List<Object?> get props =>
      [
        image,
        body,
      ];
}