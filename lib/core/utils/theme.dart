import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_smart_task/core/utils/colors.dart';

ThemeData customTheme() {


  return ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Futura',
  primaryColor: AppColors.blue,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(size: 25.sp,fill: 1),
    centerTitle: true,

  ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.r),
        borderSide: BorderSide(color: AppColors.blue, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.r),
        borderSide: BorderSide(color: AppColors.blue, width: 2),
      ),
    ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
  useMaterial3: true,
);
}