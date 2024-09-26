import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_color.dart';
MaterialColor swatchColor = const MaterialColor(
  0xff006466, // The primary value of the color, which is black in this case
  <int, Color>{
    50: Color(0xff006466), // You can define shades of black if needed
    100: Color(0xff006466),
    200: Color(0xff006466),
    300: Color(0xff006466),
    400: Color(0xff006466),
    500: Color(0xff006466),
    600: Color(0xff006466),
    700: Color(0xff006466),
    800: Color(0xff006466),
    900: Color(0xff006466),
  },
);

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  useMaterial3: false,
  scaffoldBackgroundColor: AppColors.myWhite,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.myWhite,
    titleTextStyle: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.myGrey,
      size: 20.r,
    ),
  ),
  textTheme: TextTheme(
    //ToDo//textStyle type sort
    //  bodySmall
    //  bodyMedium
    //  bodyLarge
    //  displaySmall
    //  displayMedium
    //  displayLarge
    //  titleSmall
    //  titleMedium
    //  titleLarge
    //  headlineSmall
    //  headlineMedium
    //  headlineLarge
labelMedium: GoogleFonts.almarai(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.myWhite,

  ),
),
    labelSmall:GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.myGrey,

      ),
    ),
    labelLarge: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,

      ),
    ),

    bodySmall: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.dark,

      ),
    ),
    bodyMedium: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.dark,
      ),
    ),
    bodyLarge:GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.dark,

      ),
    ),
    displaySmall: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greyWithOP70,
      ),
    ),
    displayMedium: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
    ),
    displayLarge:GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.myWhite,

      ),
    ),

    titleSmall: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,
      ),
    ),
    titleLarge: GoogleFonts.plusJakartaSans(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    ),
    headlineSmall: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.dotBackground,
      ),
    ),

    headlineMedium: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    ),
    headlineLarge: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.dotBackground,
      ),
    ),



  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor:
        MaterialStateProperty.all<Color>(AppColors.dotBackground),
        textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: AppColors.dotBackground,
          fontWeight: FontWeight.bold,
        ))),
  ),
  iconTheme: IconThemeData(
    color: AppColors.myGrey,
    size: 20.r,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    // backgroundColor: AppColors.myWhite,
    //   elevation: 5,
    unselectedIconTheme: IconThemeData(
      size: 14.r,
    ),
    selectedIconTheme: IconThemeData(
      size: 14.r,
    ),
    //   unselectedIconTheme: IconThemeData(
    //     color: AppColors.colorIconButtonNavBar,
    //     size: 20,
    //   ),
    elevation: 8,
    selectedItemColor: AppColors.primaryColor,
    selectedLabelStyle: GoogleFonts.plusJakartaSans(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,

    ),
    unselectedLabelStyle: GoogleFonts.plusJakartaSans(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.dotBackground,
    ),
    unselectedItemColor: AppColors.dotBackground,

  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith((_) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        );
      }),
      animationDuration: const Duration(milliseconds: 2000),
      overlayColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.primaryColor),

      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return AppColors.myWhite;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return AppColors.primaryColor;
        }
        return AppColors.primaryColor;
      }),
    ),
  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: swatchColor).copyWith(surface: AppColors.myWhite),
);
