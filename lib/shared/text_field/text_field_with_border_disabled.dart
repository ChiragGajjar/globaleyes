import 'package:flutter/services.dart';
import 'package:globaleyes/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithBorderDisabled extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction action;
  int maxLine = 1;
  double fontSize;
  String fontFamily;
  String hintText;
  bool obscureTextField;
  bool withIcon;
  AssetImage? icon;
  bool isRequired;
  FocusNode myFocusNode;
  bool isNumeric;
  bool isAllowSpace;
  bool autoFocus;

  TextFieldWithBorderDisabled({
    required this.controller,
    required this.inputType,
    required this.action,
    required this.maxLine,
    this.fontSize = 12,
    required this.fontFamily,
    this.hintText = '',
    this.obscureTextField = false,
    this.withIcon = false,
    this.icon,
    required this.myFocusNode,
    this.isRequired = false,
    this.isNumeric = false,
    this.isAllowSpace = false,
    this.autoFocus = true
  }) {
    this.fontFamily =
    fontFamily ?? FontsFamily.GilroyRegular;
    // this.myFocusNode.requestFocus(myFocusNode);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        // inputFormatters: isNumeric ? [new FilteringTextInputFormatter.allow(RegExp("[0-9]"))] : [],

        autofocus: autoFocus,
        keyboardType: inputType,
        textInputAction: action,
        readOnly: true,
        controller: controller,
        enableInteractiveSelection: false,
        maxLines: 1,
        obscureText: obscureTextField,
        focusNode: myFocusNode,
        cursorColor: AppColors.appThemeColor,
        decoration: InputDecoration(
          labelText: isRequired ? '$hintText *' : hintText,
          hintStyle: const TextStyle(color: AppColors.lightGrayFontColor),
          labelStyle: const TextStyle(
            color: AppColors.lightGrayFontColor,
            fontFamily: FontsFamily.GilroyRegular,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,),
          /* labelStyle: TextStyle(
          color: myFocusNode.hasFocus
              ? AppColors.lightGrayFontColor
              : AppColors.lightGrayFontColor),*/
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w, color: AppColors.greyBorderColor),
              borderRadius: BorderRadius.circular(12.r)),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 1.w, color: AppColors.greyBorderColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.w, color: AppColors.greyBorderColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.w, color: AppColors.greyBorderColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          suffixIcon: Container(
            padding: EdgeInsets.only(top:15.h, bottom: 15.h, left: 15.w, right: 15.w),
            child: withIcon
                ? Image(
              image: icon!,
              width: 10.w,
              height: 10.h,
              fit: BoxFit.contain,
            )
                : const Icon(null),
          ),
        ),
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
