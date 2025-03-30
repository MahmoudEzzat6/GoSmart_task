import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:go_smart_task/features/main_screens/home/home_widgets/nav_bar.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../components/default_button.dart';
import '../../../components/default_text_filed.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../cubits/auth_cubit/signin/sign-in_states.dart';
import '../../../cubits/auth_cubit/signin/signin_cubit.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var confirmPasswordController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Form(
                key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0.h, horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.0.h, left: 5.w),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                        child: defaultTextField(
                            controller: nameController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'This Filed can\'t be empty';
                              }
                            },
                            label: 'Name',
                            hintColor: AppColors.blue,
                            suffixColor: Colors.black,
                            suffixPress: () {
                              cubit.changeSuffixLoginScreen();
                            }),
                      ),
                      if (!cubit.isPhoneValid||phoneController.text.isEmpty)
                        Row(
                          children: [

                            Padding(
                              padding: EdgeInsets.only(top: 1.0.h, left: 5.w),
                              child: Text(
                                'Phone Number',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'phone not verified',
                                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                                  ),
                                  SizedBox(width: 8.w),
                                  Image.asset(AppAssets.redCross, height: 25.h, width: 25.w),

                                ],
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: AppColors.lightGrey),
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          controller: phoneController,
                          validator: (phone) {
                            cubit.validatePhone(phone?.number);
                            return cubit.isPhoneValid ? null : ''; // Prevent default error message
                          },
                          initialCountryCode: 'EG',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0.h, left: 5.w),
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                        child: defaultTextField(
                            controller: passwordController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'This Filed can\'t be empty';
                              }
                            },
                            label: 'Password',
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixColor: Colors.black,
                            suffixPress: () {
                              cubit.changeSuffixLoginScreen();
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0.h, left: 5.w),
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                        child: defaultTextField(
                            controller: confirmPasswordController,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'This Filed can\'t be empty';
                              }
                            },
                            isPassword: cubit.isConfirmPassword,

                            label: 'Confirm Password',
                            suffix: cubit.confirmSuffix,
                            suffixColor: Colors.black,
                            suffixPress: () {
                              cubit.changeConfirmSuffixLoginScreen();
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.changeAgree();
                              print( '${ cubit.isAgree
                                  }' );
                            },
                            child: Container(
                              width: 20, // Adjust size
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: AppColors.blue, width: 2),
                              ),
                              child: cubit.isAgree
                                  ? Center(
                                      child: Container(
                                        width: 10, // Inner dot size
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              AppColors.blue, // Inner dot color
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'I have read and agreed to the ',
                            style: TextStyle(
                                color: AppColors.lightGrey, fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 25.w,),
                          Text(
                            'Terms ',
                            style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue),
                          ),
                          Text(
                            'and ',
                            style: TextStyle(
                                color: AppColors.lightGrey,
                                fontSize: 14.sp,
                                decorationColor: AppColors.blue),
                          ),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue),
                          ),
                        ],
                      ),


                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      defaultButton(
                          textColor: Colors.white,
                          isUpper: false,
                          textSize: 14.sp,
                          onTap: () {
                            if (formKey.currentState!.validate()||cubit.isAgree==true) {
                              GoRouter.of(context).pushReplacement('/mainScreen');

                            } else {
                              return null;
                            }
                          },
                          text: 'Register'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
