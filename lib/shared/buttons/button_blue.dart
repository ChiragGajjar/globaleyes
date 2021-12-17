import 'package:globaleyes/common_imports.dart';

import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final VoidCallback onPress;
  final String name;

  ButtonBlue(this.name,{required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      width: AppUtils.instance.screenWidth(context),
      alignment: Alignment.center,
      child: MaterialButton(
        color: AppColors.appColor,
        padding: EdgeInsets.fromLTRB(50.w, 10.h, 50.w, 10.h),
        child: Text(
          name,
        ),
        textColor: AppColors.white,
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}