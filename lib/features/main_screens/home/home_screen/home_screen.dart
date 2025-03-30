import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:go_smart_task/core/utils/assets.dart';
import 'package:go_smart_task/core/utils/colors.dart';
import 'package:go_smart_task/cubits/home_cubit/home_cubit.dart';
import 'package:go_smart_task/features/main_screens/profile/profile_screen/profile_screen.dart';

import '../../../../cubits/home_cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            toolbarHeight: 100.h,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.horse,
                        width: 30.w,
                        height: 35.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('equinaCLUB',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'FuturaPT-Medium',
                              fontWeight: FontWeight.w500)),
                      Spacer(),
                      Container(
                          height: 30.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AppAssets.family,
                              width: 15.w,
                              height: 15.h,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 30.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Image.asset(
                              AppAssets.notification,
                              width: 35.w,
                              height: 35.h,
                            ),
                          ),
                          Positioned(
                            right: 2, // Adjust position
                            top: -2.h, // Adjust position
                            child: Container(
                              padding: EdgeInsets.all(4.w), //
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 14.w,
                                minHeight: 14.h,
                              ),
                              child: Center(
                                child: Text(
                                  '0', // Replace with your dynamic count
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: (){
                          GoRouter.of(context).push('/profile');                          },
                        child: Image.asset(
                          AppAssets.profile,
                          width: 35.w,
                          height: 35.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                              children: [
                                TextField(
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              AppAssets.filter,
                              width: 35.w,
                              height: 35.h,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body:state is HomeLoadingStates ?  Center(child: CircularProgressIndicator(color: AppColors.blue,)) :ListView.builder(
            itemCount: cubit.model?.lessons?.length ?? 0,
            itemBuilder: (context, index) {
              var lesson = cubit.model?.lessons?[index];

              if (lesson == null) return SizedBox();

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 160.h,
                        child: Stack(
                          children: [
                            // Background Container
                            Positioned.fill(
                              child: InkWell(
                                onTap: () {
                                  print("Club Name: ${lesson.clubName}");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                ),
                              ),
                            ),

                            // Text & Details Section
                            Positioned(
                              top: 12.h,
                              left: 18.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lesson.name ?? "No Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'FuturaPT-Demi',
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Container(
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        lesson.clubName ?? "Unknown Club",
                                        style: TextStyle(
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  lesson.description==null?  Text(
                                    'Not Available',
                                    style: TextStyle(color: Colors.white),
                                  ):
                                  Text(
                                    'Description: ${lesson.description ?? "N/A"}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    'Type: ${lesson.lessontype ?? "Unknown"}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    'Class Duration: ${lesson.classDuration ?? "N/A"} min',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    'Number Of Classes: ${lesson.numOfClasses?.toInt() ?? "N/A"}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),

                            // Price Tag Box
                            Positioned(
                              bottom: 0.h,
                              left: 0.w,
                              child: Container(
                                height: 35.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: AppColors.purble,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.r),
                                    bottomLeft: Radius.circular(20.r),
                                    topLeft: Radius.circular(2.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 3.h),
                                    Text(
                                      'starting from',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100 AED', // Dynamic price
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              left: 95.w,
                              child: Row(
                                children: [
                                  Container(
                                    width: 30.w,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Mon',
                                        style: TextStyle(
                                            color: AppColors.purble,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),

                                  // Single Container for "Thu"
                                  Container(
                                    width: 30.w,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Thu',
                                        style: TextStyle(
                                            color: AppColors.purble,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),

                                  // Single Container for "Fri"
                                  Container(
                                    width: 30.w,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Fri',
                                        style: TextStyle(
                                            color: AppColors.purble,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            // Image Positioned on the Right
                            Positioned(
                              top: 0,
                              right: 0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    bottomRight: Radius.circular(95.r),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Background Image
                                      Image.asset(
                                        AppAssets.girlRider,
                                        fit: BoxFit.cover,
                                        width: 130.w,
                                        height: 200.h,
                                      ),

                                      // Star Rating Positioned on Top
                                      Positioned(
                                        top: 10.h,
                                        // Adjust the position as needed
                                        left: 4.w,
                                        child: RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20.w,
                                          // Adjust star size
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),

                                      // Promo Box
                                      Positioned(
                                        bottom: 45.h,
                                        left: 20.w,
                                        child: Container(
                                          height: 35.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.purble.withOpacity(
                                                0.85),
                                            borderRadius: BorderRadius.circular(
                                                12.r),
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 1.5), // White outline
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 3.h),
                                              Text(
                                                'Buy and Get',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '5% and 500 Points',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )
        );
      },
    );
  }
}
