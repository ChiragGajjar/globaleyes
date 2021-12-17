import 'package:globaleyes/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithIcon extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction action;
  int maxLine = 1;
  double fontSize;
  String fontFamily;
  String hintText;
  bool obscureTextField;
  FocusNode myFocusNode;
  bool passwordVisible;

  TextFieldWithIcon(
      {required this.controller,
      required this.inputType,
      required this.action,
      required this.maxLine,
      this.fontSize = 12,
      required this.fontFamily,
      this.hintText = '',
      required this.myFocusNode,
      required this.passwordVisible,
      this.obscureTextField = false}) {
    this.fontFamily =
        fontFamily ?? FontsFamily.GilroyRegular;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        autofocus: false,
        keyboardType: inputType,
        textInputAction: action,
        controller: controller,
        maxLines: 1,
        obscureText: obscureTextField,
        focusNode: myFocusNode,
        cursorColor: AppColors.appThemeColor,
        decoration: InputDecoration(
            labelText: hintText,
            suffixIcon: IconButton(
              icon: Image(
                height: 10,
                width: 10,
                // Based on passwordVisible state choose the icon
                image: passwordVisible
                    ? AppImages.icOpenEye
                    : AppImages.icCloseEye,
                // color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                passwordVisible = !passwordVisible;
              },
              //),
              // myIcon is a 48px-wide widget.
            ),

/*
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              // padding: const EdgeInsetsDirectional.only(end: 12.0),
              child: GestureDetector(
                child: Image(
                  image: AppImages.ic_open_eye,
                  width: 10,
                  height: 10,
                ),
              ),
              // myIcon is a 48px-wide widget.
            ),
*/
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? AppColors.appThemeColor
                    : AppColors.lightGrayFontColor,
              fontFamily: FontsFamily.GilroyRegular,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.greyBorderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.appThemeColor),
              borderRadius: BorderRadius.circular(12),
            )),
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
