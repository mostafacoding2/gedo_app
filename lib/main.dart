import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/notification_handler.dart';
import 'package:alzcare/features/authentication/presentation/screens/select_type_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'core/services/services_locator.dart';
import 'core/theme/light_theme.dart';
import 'core/utils/app_string.dart';
import 'core/utils/bloc_observe.dart';
import 'core/utils/dio_helper.dart';
import 'core/utils/lang cubit/langcubit_cubit.dart';
import 'core/utils/lang cubit/langcubit_state.dart';
import 'core/utils/shared _pref.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await Firebase.initializeApp();
  NotificationHandler notificationHandler = NotificationHandler();
  await DioHelper.init();
  ServicesLocator().init();
  await PreferenceUtils.init();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  token=PreferenceUtils.getString(SharedKeys.token,);
  userType=PreferenceUtils.getString(SharedKeys.userType,);
  userName=PreferenceUtils.getString(SharedKeys.userName,);
  userId=PreferenceUtils.getString(SharedKeys.userId,);
  patientCode=PreferenceUtils.getString(SharedKeys.patientCode,);
  print(patientCode);

  print(token);
  print("userId$userId");
  print(userName);
  final Widget widget;
  (token == '')
      ? widget = const SelectTypeUserScreen()
      : widget = BottomNavScreen(
          currentIndex: null,
        );
  runApp(
    MyApp(
      userId: userId,
      userName: userName,
      startWidget: widget,
    ));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key,this.startWidget,this.userId,this.userName});
  final  String ? userId;
  final  String ? userName;
  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return BlocProvider(
            create: (context) =>
            LocaleCubit()
              ..getSavedLanguage(),
            child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                if(LocaleCubit.get(context).load != null)
                {
                  return MaterialApp(
                    title: AppString.appName,
                    theme: lightTheme,
                    locale: const Locale('ar'),
                    supportedLocales: const [Locale('ar'), Locale('en')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return const Locale('ar');
                        }
                      }
                      return const Locale('ar');
                    },
                    debugShowCheckedModeBanner: false,
                    home: startWidget,
                  );
                }
                return const SizedBox();
              },
            ),
          );
        });
  }
}




