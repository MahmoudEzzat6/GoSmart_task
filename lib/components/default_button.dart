import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/colors.dart';


  Widget defaultButton({
    double width = double.infinity,
    double? textSize,
    double? height,
    Color? textColor,
    bool isUpper = true,
    required VoidCallback onTap,
    required String text,

  }) =>
      Container(
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(8.r)),
        width: width,
        height: height,
        child: MaterialButton(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5.w,),
              Center(
                child: Text(
                  isUpper ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ],
          ),

        ),
      );
