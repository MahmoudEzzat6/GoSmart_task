import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_smart_task/cubits/auth_cubit/signin/sign-in_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context)=>BlocProvider.of(context);

  IconData suffix=Icons.remove_red_eye;
  IconData confirmSuffix=Icons.remove_red_eye;
  bool isPassword=true;
  bool isConfirmPassword=true;
  bool isAgree=false;

  void changeSuffixLoginScreen(){
    isPassword =!isPassword;
    suffix= isPassword ? Icons.remove_red_eye :Icons.visibility_off_outlined;
    emit(LoginSuffixIconsStates());
  }
  void changeConfirmSuffixLoginScreen(){
    isConfirmPassword =!isConfirmPassword;
    confirmSuffix= isConfirmPassword ? Icons.remove_red_eye :Icons.visibility_off_outlined;
    emit(LoginSuffixIconsStates());
  }

  void changeAgree(){
    isAgree =!isAgree;
    emit(LoginSuffixIconsStates());
  }
  bool isPhoneValid = true;

  void validatePhone(String? phone) {
    if (phone == null || phone.isEmpty || phone.length < 10) {
      isPhoneValid = false;
    } else {
      isPhoneValid = true;
    }
    emit(LoginPhoneValidationState()); // Notify UI to rebuild
  }

  int selectedUser = 0; // Default selection: First option

  void selectUser(int index) {
    selectedUser = index;
    emit(UserSelectedState(index));
  }

}