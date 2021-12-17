import 'dart:async';
import 'package:globaleyes/common_imports.dart';
import 'package:globaleyes/values/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
        pushNamed(context, AppRoute.scannerScreen);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget getBodyWidget(Size size) {
    // TODO: implement getBodyWidget
    return const Scaffold(
      body: Center(
        child: Image(
          image:AppImages.appLogo,
          // width: 140.0,
          height: 160.0,
        ),
      ),
    );
  }
}
