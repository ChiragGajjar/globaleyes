import 'package:globaleyes/common_imports.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String name;
  final Color color;
  final Color txtColor;
  final double height;
  final double fontSize;
  EdgeInsets? margin;
  String fontFamily;
  FontWeight fontWeight;

  CustomButton(this.name,
      {required this.onPress,
      this.color = AppColors.appThemeColor,
      this.fontSize = 16,
      this.height = 50,
      this.fontFamily = FontsFamily.GilroyRegular,
      this.fontWeight = FontWeights.bold,
        this.margin,
      this.txtColor = AppColors.white,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: margin,
          height: height,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
              ),
              onPressed: () => {onPress()},
              child: Text(
                name,
                style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w500,
                  color: txtColor
                ),
              )),
        ),
      ],
    );
  }
}
