import 'package:flutter/material.dart';
import 'package:globaleyes/values/app_colors.dart';

import '../../../common_imports.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPress;
  CustomBackButton({required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 44.h,
      // color: AppColors.black,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: AppColors.backButtonColor.withOpacity(0.05),
      ),
      child: IconButton(
        onPressed: () {
          onPress();
          // pushNamed(context, AppRoute.addDevice);
        },
        icon: Image(
          image: AppImages.icBackGrey,
          width: 16.w,
          height: 16.h,
        ),
      ),
    );
  }
}
