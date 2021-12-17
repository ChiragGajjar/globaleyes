import 'package:globaleyes/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldBorderedWithPrefix extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction action;
  int maxLine = 1;
  double fontSize;
  String fontFamily;
  String hintText;
  bool obscureTextField;
  bool passwordVisible = true;

  TextFieldBorderedWithPrefix(
      {Key? key, required this.controller,
      required this.inputType,
      required this.action,
      required this.maxLine,
      this.fontSize = 12,
      required this.fontFamily,
      this.hintText = '',
      this.obscureTextField = false}) : super(key: key) {
    this.fontFamily = fontFamily ?? FontsFamily.GilroyRegular;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
            /* contentPadding: EdgeInsets.only(
              bottom: 20 / 2, // HERE THE IMPORTANT PART
            ),*/
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: IconButton(
              icon: Image(
                height: 10,
                width: 10,
                // Based on passwordVisible state choose the icon
                image: passwordVisible
                    ? AppImages.icOpenEye
                    : AppImages.icCloseEye,
                // color: Theme.of(context).primaryColorDark,
              ), onPressed: () {  },

              //),
              // myIcon is a 48px-wide widget.
            ),
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
