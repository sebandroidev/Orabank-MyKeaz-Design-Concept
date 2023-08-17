import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.colorWhite,
    primaryColor: AppColors.colorPrimary,
    useMaterial3: true,
    cardTheme: const CardTheme(
      color: Color(0xFFF2F2F2),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      color: AppColors.colorWhite,
      scrolledUnderElevation: 0,
    ),
    chipTheme: ChipThemeData(
      side: BorderSide.none,
      backgroundColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.h),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFEFF2F5),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFD5DEE7),
      thickness: .5,
    ),
    primarySwatch: createMaterialColor(AppColors.colorPrimary),
    textTheme: lightTextTheme,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.colorPrimary,
      onPrimary: AppColors.colorWhite,
      onBackground: Color(0xFF1C1B1F),
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.colorWhite,
    //   selectedIconTheme: IconThemeData(
    //     color: AppColors.colorPrimary,
    //   ),
    //   selectedLabelStyle: TextStyle(color: AppColors.colorPrimary),
    // ),
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
