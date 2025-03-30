import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/colors.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 10, // Blur effect
            offset: Offset(0, 2), // Offset to move shadow down
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 160.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        bottomLeft: Radius.circular(20.r),
                        topRight: Radius.circular(35.r),
                        bottomRight: Radius.circular(40.r))
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
                    'Assessment Tina',
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
                        'Talaat Club',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text('Description: cdcdcdcdcdccdc', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 3.h),
                  Text('Type: Assessment', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 3.h),
                  Text('Class Duration: 45 min', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 3.h),
                  Text('Number Of Classes: 13', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // Decorated Small Box
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
                    SizedBox(height: 3.h,),
                    Text('starting from',style: TextStyle(color: Colors.white,fontSize: 11.sp,fontWeight: FontWeight.w400),),
                    Text('150 AED',style: TextStyle(color: Colors.white,fontSize: 11.sp,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
            ),
            // Decorated Dates
            // Correctly Position the Whole Row
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
                        style: TextStyle(color: AppColors.purble, fontSize: 10.sp),
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
                        style: TextStyle(color: AppColors.purble, fontSize: 10.sp),
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
                        style: TextStyle(color: AppColors.purble, fontSize: 10.sp),
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
                        top: 10.h, // Adjust the position as needed
                        left: 4.w,
                        child: RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20.w, // Adjust star size
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
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
                            color: AppColors.purble.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.white, width: 1.5), // White outline
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
        )

        ,

      ),
    );
  }
}
