import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:go_smart_task/core/utils/assets.dart';

import '../profile_widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: InkWell(
            onTap: (){
              GoRouter.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,)),
          toolbarHeight: 50.h,
      ),
       backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(15.w),
          child: Column(
            children: [
              Center(child: Image.asset(AppAssets.profile)),
            SizedBox(height: 5.h,),
            Text('Equina User', style: TextStyle( fontSize: 18.sp,fontWeight: FontWeight.w500,fontFamily:'FuturaPT-Medium' ),),
             SizedBox(height: 20.h,),
              Container(
                height: 490.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r)),
             child:CustomListView() ,
              ),
             //\ CustomListView()
            ],
          ),
        ),
      ),
      
    );
  }
}
