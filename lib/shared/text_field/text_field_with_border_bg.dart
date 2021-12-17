import 'package:flutter/services.dart';
import 'package:globaleyes/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithBorder extends StatelessWidget {
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
  bool isDouble;
  bool isAllowSpace;
  bool isDigitWithHighphen;
  bool isLimitCharacter;
  int characterLimit;
  bool alphaWithSpace;
  bool alphaWithoutSpace;
  bool prventLength;
  bool enabled;
  bool readOnly;
  bool isExpiryDate;
  ValueChanged<String>? onTextChange;

  TextFieldWithBorder({Key? key,
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
    this.isDouble = false,
    this.isAllowSpace = false,
    this.isLimitCharacter = false,
    this.alphaWithSpace = false,
    this.alphaWithoutSpace = false,
    this.prventLength = false,
    this.isDigitWithHighphen = false,
    this.characterLimit = 0,
    this.onTextChange,
    this.enabled = true,
    this.readOnly = false,
    this.isExpiryDate = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        onChanged: (text) {
          if (onTextChange != null) {
            onTextChange!(text.isNotNullOrEmpty() ? text : '');
          }
        },
        inputFormatters: isAllowSpace
            ? [FilteringTextInputFormatter.allow(RegExp("[a-z]"))]
            : isNumeric
                ? [FilteringTextInputFormatter.allow(RegExp("[0-9]"))]
                  : isExpiryDate
                  ? [FilteringTextInputFormatter.allow(RegExp("(?:0[1-9]|1[0-2])/[0-9]{2}"))]
                : prventLength
                ? [LengthLimitingTextInputFormatter(5)]
                : isDigitWithHighphen
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9-]"))
                      ]
                    : isLimitCharacter
                        ? [LengthLimitingTextInputFormatter(characterLimit)]
                        : alphaWithSpace
                            ? [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[A-Za-z ]"))
                              ]
                            : alphaWithoutSpace
                                ? [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[A-Za-z0-9]"))
                                  ]
                                : isDouble
                                    ? [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                                      ]
                                    : [],
        autofocus: false,
        maxLength: isLimitCharacter ? characterLimit : 200,

        keyboardType: inputType,
        textInputAction: action,
        controller: controller,
        maxLines: 1,
    enabled: enabled,
    readOnly: readOnly,
    obscureText: obscureTextField,
        focusNode: myFocusNode,
        cursorColor: AppColors.appThemeColor,
        decoration: InputDecoration(
          labelText: isRequired ? '$hintText *' : hintText,
          hintStyle: TextStyle(color: AppColors.lightGrayFontColor),
          labelStyle: TextStyle(
            color: myFocusNode.hasFocus
                ? AppColors.appThemeColor
                : AppColors.lightGrayFontColor,
            fontFamily: FontsFamily.GilroyRegular,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: AppColors.greyBorderColor),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.appThemeColor),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          suffixIcon: withIcon
              ? Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.black12,
                  child: Image(
                    image: icon!,
                    width: 10.w,
                    height: 10.h,
                    fit: BoxFit.contain,
                  ),
                )
              : null,
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
