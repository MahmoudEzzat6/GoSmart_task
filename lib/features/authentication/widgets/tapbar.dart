import 'package:flutter/cupertino.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_smart_task/core/utils/colors.dart';
import 'package:go_smart_task/features/authentication/views/register.dart';
import 'package:go_smart_task/features/authentication/views/sign_in.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainedTabBarView(
      tabs: [
        Text('Sign in'),
        Text('Register'),
      ],
      views: [
        LoginScreen(),
        Register(),
      ],
      tabBarProperties: TabBarProperties(
        labelStyle: TextStyle(color: Colors.black,fontFamily: 'FuturaPT-Medium.ttf',fontWeight: FontWeight.w500),
        indicatorColor: AppColors.blue,
        indicatorWeight: 3.w,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey,
      ),

    );
  }
}
