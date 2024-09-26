import 'package:alzcare/core/utils/constant.dart';

class ApiConstant {
  static const String baseUrl = 'https://alzcare.onrender.com/alzcare/v1/';
  static const String patientSignUp = 'auth/patient-register';
  static const String careGiverSignUp = 'auth/care-giver-register';
  static const String login = 'auth/login';
  static const String forgetPassword = 'forgot-password';
  static const String verifyCode = 'check-code';

  static String resetPassword(String userId) => 'reset-password/$userId';
  static String postmedicalDetails = userType == '3'
      ? 'care-giver/medical-details/create-patient-medical-details'
      : 'medical-details';

  static String getallmedicalDetails(String userId) => userType == '3'
      ? 'care-giver/medical-details/get-all-patient-medical-details'
      : 'medical-details/get-all/$userId';

  static String getMedicalDetails(String userId) => userType == '3'
      ? 'care-giver/medical-details/get-patient-medical-details/$userId'
      : 'medical-details/$userId';

  static String deletemedicalDetails(String userId) => userType == '3'
      ? 'care-giver/medical-details/delete-patient-medical-details/$userId'
      : 'medical-details/$userId';
  static String posttest =
      userType == '3' ? 'care-giver/test/create-patient-test' : 'tests';

  static String getalltests(String userId) => userType == '3'
      ? 'care-giver/test/get-all-patient-tests'
      : 'tests/get-all/$userId';

  static String gettests(String userId) => userType == '3'
      ? 'care-giver/test/get-patient-test/$userId'
      : 'tests/$userId';

  static String deletetests(String userId) => userType == '3'
      ? 'care-giver/test/delete-patient-test/$userId'
      : 'tests/$userId';

  static String prescriptions = userType == '3'
      ? 'care-giver/prescription/create-patient-prescription'
      : 'prescriptions';

  static String getallprescriptions(String userId) => userType == '3'
      ? 'care-giver/prescription/get-all-patient-prescription'
      : 'prescriptions/get-all/$userId';

  static String deleteprescriptions(String userId) => userType == '3'
      ? 'care-giver/prescription/delete-patient-prescription/$userId'
      : 'prescriptions/$userId';

  static String getprescriptions(String userId) => userType == '3'
      ? 'care-giver/prescription/get-patient-prescription/$userId'
      : 'prescriptions/$userId';
  static const String changeprofiledata = 'profile/change-profile-image';
  static const String changepassword = 'profile/change-password';
  static String postmedicationreminder = userType == '3'
      ? 'care-giver/medication-reminder/create-patient-medication-reminder'
      : 'medication-reminder';

  static String getallmedicationreminder(String userId) => userType == '3'
      ? 'care-giver/medication-reminder/get-all-patient-medication-reminders'
      : 'medication-reminder/get-all/$userId';

  static String deletemedicationreminder(String userId) => userType == '3'
      ? 'care-giver/medication-reminder/delete-patient-medication-reminder/$userId'
      : 'medication-reminder/$userId';

  static const String createpost = 'community/post';
  static const String getallposts = 'community/posts';

  static String postcomment(String userId) => 'community/post/$userId/comment';

  static String getallcomment(String userId) =>
      'community/post/$userId/comments';

  static String togglepostlikes(String userId) => 'community/post/$userId/like';

  static String togglecommentlikes(String userId) =>
      'community/comment/$userId/like';

  static String postmessage(String userId) => 'chat/create?recipientId=$userId';

  static String getallmessages(String userId) =>
      'chat/get-all?recipientId=$userId';

  static String getallmyposts(String userId) => 'community/user/$userId/posts';

  static String deleteposts(String userId) => 'community/post/$userId';
  static const String getcurrentuser = 'auth/current-user';
  static const String saveToken = 'auth/save-token';
  static const String getAllNotification = 'notification/get-all';
  static const String deleteAllNotification = 'notification/delete-all';
}
