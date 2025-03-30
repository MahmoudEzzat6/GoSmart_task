import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:go_smart_task/core/utils/assets.dart';
import 'package:go_smart_task/core/utils/colors.dart';
import '../../../../data/models/profile_model/list_model.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemExtent: 55.h,
            itemCount: profileData.length + 1, // +1 for Logout
            itemBuilder: (context, index) {
              if (index == profileData.length) {
                return Column(
                  children: [
                    Divider(thickness: 1, color: Colors.grey.shade300), // Divider before Logout
                    Expanded(
                      child: ListTile(
                        leading: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.2), // Light red for logout
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Image.asset(AppAssets.logOut),
                        ),
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'FuturaPT-Medium',
                          ),
                        ),
                        onTap: () {
                          GoRouter.of(context).goNamed('/loginScreen');
                        },
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),

                      ),
                    ),
                  ],
                );
              }

              final item = profileData[index];
              return ListTile(
                leading: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.purble, // Light purple background
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.scaleDown,
                       color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'FuturaPT-Medium.ttf',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
                onTap: () {
                  // Handle item tap
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
