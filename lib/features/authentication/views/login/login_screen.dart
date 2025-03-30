import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_smart_task/core/utils/assets.dart';
import 'package:go_smart_task/core/utils/colors.dart';

import '../../widgets/tapbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:66.0.h,right: 80.w,left: 80..w,bottom: 18.h),
            child: Image.asset(AppAssets.logoText),
          ),
          Text('Welcome to equina',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "FuturaPT-Demi"
          ),),
          SizedBox(height: 2.h,),
          Text('    equinaClub,book your\nclasses-advance your game.',style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 16.sp
          ),),
          SizedBox(height: 5.h,),
          Expanded(
              child: CustomTabBar()
          )

        ],
      ),
    );
  }
}

