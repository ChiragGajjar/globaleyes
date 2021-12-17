import 'package:globaleyes/common_imports.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPress;
  final String name;
  final Color color;
  final double height;
  final double width;
  final double fontSize;
  EdgeInsets margin;
  String fontFamily;
  FontWeight fontWeight;

  CustomLoginButton(this.name,
      {required this.onPress,
      this.color = AppColors.appThemeColor,
      this.fontSize = 16,
      this.height = 50,
      this.fontFamily = FontsFamily.GilroyRegular,
      this.fontWeight = FontWeights.medium,
      this.width = 150,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          height: height,
          width: width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            onPressed: () => {onPress()},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: fontFamily,
                      fontWeight: fontWeight),
                ),
                const Image(
                  image: AppImages.icBackGrey,
                  width: 24.0,
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
