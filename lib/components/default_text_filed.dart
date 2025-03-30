import 'package:flutter/material.dart';

import '../core/utils/colors.dart';

Widget defaultTextField({
  required TextEditingController? controller,
  Color? textColor,
  TextInputType? type,
  Function()? onTap,
  Color? color,
  Color? hintColor, // Ensure hintColor is passed
  Function(String)? onChange,
  required String? Function(String?) validate,
  Function(String)? onSubmit,
  bool isPassword = false,
  required String? label,
  String? hintText, // Add hintText parameter
  IconData? suffix,
  Color? suffixColor,
  Function()? suffixPress,
}) {
  return TextFormField(
    showCursor: true,
    cursorColor: Colors.black,
    style: TextStyle(color: textColor ?? Colors.black), // Apply text color
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onChanged: onChange,
    onTap: onTap,
    onFieldSubmitted: onSubmit,
    validator: validate,
    decoration: InputDecoration(
      errorStyle: const TextStyle(color: Colors.red),
      labelStyle: const TextStyle(color: AppColors.lightGrey),
      floatingLabelStyle: const TextStyle(color: AppColors.blue),
      labelText: label,
      hintText: hintText, // Set hint text
      hintStyle: TextStyle(color: hintColor ?? Colors.grey), // Set hint color

      suffixIcon: suffix != null
          ? IconButton(
        onPressed: suffixPress,
        icon: Icon(
          suffix,
          color: suffixColor,
        ),
      )
          : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}











