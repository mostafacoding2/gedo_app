import 'package:equatable/equatable.dart';
  class ProfileEntity {
  final String ?status;
  final int ?code;
  final String? message;
  final DataProfile ?data;
  const ProfileEntity({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  List<Object?> get props => [status, code, message, data];
}
class DataProfile {
  final String ?uname;
  final ProfileImage? profileImage;
  final String ?patientCode;
  final String ?mail;
  final int ?userType;
  final String? id;

  const DataProfile({
    required this.uname,
    required this.profileImage,
    required this.patientCode,
    required this.mail,
    required this.userType,
    required this.id,
  });
  List<Object?> get props =>
      [
        uname,
        profileImage,
        patientCode,
        mail,
        userType,
        id,
      ];
}
class ProfileImage extends Equatable {
  final String ?url;
  final String ?publicId;
  const ProfileImage({
    required this.url,
    required this.publicId,
  });
  @override
  List<Object?> get props => [url, publicId];
}
