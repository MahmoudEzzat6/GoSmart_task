import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_smart_task/core/utils/assets.dart';
import '../../../components/default_button.dart';
import '../../../components/default_text_filed.dart';
import '../../../core/utils/colors.dart';
import '../../../cubits/auth_cubit/signin/sign-in_states.dart';
import '../../../cubits/auth_cubit/signin/signin_cubit.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          userSelectionContainer(
                            context,
                            title: "Equestrian User",
                            index: 0,
                            isSelected: cubit.selectedUser == 0,
                            imagePath: AppAssets.editProfile,
                          ),
                          SizedBox(width: 16.w),
                          userSelectionContainer(
                            context,
                            title: "Trainer User",
                            index: 1,
                            isSelected: cubit.selectedUser == 1,
                            imagePath: AppAssets.editProfile,
                          ),
                        ],
                      ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0.h, left: 5.w),
                          child: Text(
                            'Phone Number',
                            style: TextStyle(fontSize: 14.sp),
                          ),
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
                          initialCountryCode: 'AE',
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
                            validate:(String? value) {
                              if (value!.isEmpty) {
                                return 'This Filed can\'t be empty';
                              }
                            },
                            isPassword: cubit.isPassword,
                            label: 'Password',
                            suffix: cubit.suffix,
                            hintColor: Colors.greenAccent,
                            suffixColor: Colors.black,
                            suffixPress: () {
                              cubit.changeSuffixLoginScreen();
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'or login ',
                            style: TextStyle(
                                color: AppColors.lightGrey, fontSize: 14.sp),
                          ),
                          Text(
                            'As a Guest',
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
                      Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'FuturaPT-Demi'),
                            ),
                          )),
                      SizedBox(
                        height: 25.h,
                      ),
                      defaultButton(
                          textColor: Colors.white,
                          isUpper: false,
                          textSize: 14.sp,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              print('goo');
                            } else {
                              return null;
                            }
                          },
                          text: 'Sign In')
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

  Widget userSelectionContainer(BuildContext context,
      {required String title,
      required int index,
      required bool isSelected,
      required String imagePath}) {
    var cubit = LoginCubit.get(context);
    return InkWell(
      onTap: () => cubit.selectUser(index),
      child: Container(
        height: 105.h,
        width: 110.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: isSelected
                ? AppColors.blue
                : Colors.grey, // Active/Inactive border
            width: 1.9.w,
          ),
          borderRadius: BorderRadius.circular(13.r), // Rounded corners
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    radioTheme: RadioThemeData(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      fillColor: MaterialStateProperty.all(
                          AppColors.blue), // Dot color
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  child: Transform.scale(
                    scale: 1.2, // Makes entire radio bigger
                    child: Radio<int>(
                      value: index,
                      groupValue: cubit.selectedUser,
                      onChanged: (value) => cubit.selectUser(value!),
                    ),
                  ),
                ),
              ],
            ),

            //SizedBox(height: 5.h),

            Image.asset(
              imagePath,
              color: isSelected ? AppColors.blue : AppColors.lightGrey,
              height: 25.h,
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'FuturaPT-Medium',
                color: isSelected ? Colors.black : AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
