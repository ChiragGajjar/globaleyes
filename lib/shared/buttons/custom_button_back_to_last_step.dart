import 'package:globaleyes/common_imports.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton2 extends StatelessWidget {
  final VoidCallback onPress;
  final String name;
  final Color color;
  final Color txtColor;
  final double height;
  final double fontSize;
  EdgeInsets margin;
  String fontFamily;
  FontWeight fontWeight;

  CustomButton2(this.name,
      {required this.onPress,
      this.color = AppColors.appThemeColor,
      this.fontSize = 16,
      this.height = 50,
      this.fontFamily = FontsFamily.GilroyRegular,
      this.fontWeight = FontWeights.medium,
      required this.margin,
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
          child: GestureDetector(
              onTap: () => {onPress()},
              child: Text(
                name,
                textAlign: TextAlign.center,
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
