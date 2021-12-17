import 'package:globaleyes/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldBordered extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction action;
  int maxLine = 1;
  double fontSize;
  String fontFamily;
  String hintText;
  bool obscureTextField;

  TextFieldBordered(
      {Key? key, required this.controller,
      required this.inputType,
      required this.action,
      required this.maxLine,
      this.fontSize = 12,
      required this.fontFamily,
      this.hintText = '',
      this.obscureTextField = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      margin: EdgeInsets.symmetric(vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mediumGrey),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: SizedBox(
        height: 40,
        child: TextField(
          autofocus: false,
          keyboardType: inputType,
          textInputAction: action,
          controller: controller,
          maxLines: 1,
          obscureText: obscureTextField,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              bottom: 20 / 2, // HERE THE IMPORTANT PART
            ),
            border: InputBorder.none,
            hintText: hintText,
          ),
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
