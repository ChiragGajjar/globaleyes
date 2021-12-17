import 'package:globaleyes/common_imports.dart';

import 'package:flutter/material.dart';

class BaseCommonTextInput extends StatelessWidget {

  @required final TextEditingController textFieldController;
  @required final String label;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color backgroundColor;

  BaseCommonTextInput({
    required this.textFieldController,
    required this.label,
    required this.textInputType,
    required this.textInputAction,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: textInputType == TextInputType.visiblePassword,
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        hintText: label,
        fillColor: backgroundColor ?? AppColors.white,
        hintStyle: const TextStyle(color: AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.w),
          borderSide: BorderSide(style: BorderStyle.solid, width: 1, color: Colors.grey.shade50),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15)
      ),
      style: TextStyle(
        fontSize: 16.0.w,
        color: AppColors.darkBlue,
      ),
      controller: textFieldController,
    );
  }
}