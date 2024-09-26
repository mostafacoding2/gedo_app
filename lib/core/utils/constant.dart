import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';



final FlutterTts flutterTts = FlutterTts();
bool play  = false;
Future<void> speak(String text) async {
   play  = !play;
  // Stop the speech if it's already speaking
  if(!play) await flutterTts.stop();
  // Set language to Arabic (Egypt)
  await flutterTts.setLanguage('ar-EG');

  // Set speech rate (1.0 is the default)
  await flutterTts.setSpeechRate(0.5);

  // Set volume (1.0 is the default)
  await flutterTts.setVolume(1.0);

  // Set pitch (1.0 is the default)
  await flutterTts.setPitch(1.0);

  // Speak the provided text
 if(play) await flutterTts.speak(text);
}



String token = '';
String userType = '';
String patientCode = '';
String userId = '';
String userName ='';
final List<String> daysOfWeek = [
  'السبت',
  'الأحد',
  'الاثنين',
  'الثلاثاء',
  "الأربعاء",
  "الخميس",
  "الجمعة"
];
List<String> selectedDays = [];
final List<String> options = ['يوميا', 'اسبوعياً', 'شهرياً'];

bool onBoarding = false;
//if image come from api should get baseurl before phote
String imageApiUrl(image) =>
    'https://wealthest22.com/khymat-zaman-back/public/$image';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void navigateAndReplacement(context, widget) => Navigator.pushReplacement(
  context, MaterialPageRoute(builder: (context) => widget), );


void customSnakeBar({
  required context,
  required widget,
  Color? backgroundColor,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget,
      backgroundColor: backgroundColor,
    ));

Widget customAlertDialog({
  Widget? title,
  Widget? content,
  List<Widget>? actions,
  Color? backgroundColor,
  TextStyle? contentStyle,
}) =>
    AlertDialog(
      title: title,
      content: content,
      actions: actions,
      backgroundColor: backgroundColor,
      contentTextStyle: contentStyle,
    );

void signOut(context) {
  PreferenceUtils.removeData(SharedKeys.token).then((value) {
    if (value) {
      // navigateAndRemove(context, LoginScreen());
    }
  });
}

Future<bool?> flutterToast({
  required String message,
  required bool success,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: (success == true) ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );


