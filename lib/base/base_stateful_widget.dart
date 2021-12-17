import 'dart:io';
import 'package:globaleyes/common_imports.dart';
import 'package:globaleyes/shared/dialogs/app_common_dialog.dart';
import 'package:globaleyes/shared/dialogs/app_common_dialog_with_single_button.dart';
import 'package:globaleyes/shared/dialogs/app_common_dialog_with_two_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'base_view.dart';

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> implements BaseView {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => afterFirstLayout(context));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQuery = MediaQuery.of(context);

    return isDialog()
        ? getBodyWidget(mediaQuery.size)
        : Scaffold(
            // appBar: getAppBar(),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: AppColors.white,
              ),
              child: getBodyWidget(mediaQuery.size),
            ),
          );
  }

  @override
  void onError(String errorMessageKey) {
    hideProgress();
    // do nothing
  }

  @override
  void showError(String errorMessage) {
    hideProgress();
    showDialog(
      context: context,
      builder: (BuildContext context) => AppCommonDialog(
        title: AppString.appName,
        descriptions: errorMessage,
        buttonText: AppString.accept,
      ),
    );
  }

  void showErrorTwoButton(
      String strTitle,
      String errorMessage,
      String buttonTextPositive,
      String buttonTextNegative,
      Function onClickPositive,
      Function onClickNegative) {
    hideProgress();
    showDialog(
      context: context,
      builder: (BuildContext context) => AppCommonDialogWithTwoButton(
        title: strTitle,
        descriptions: errorMessage,
        buttonTextPositive: buttonTextPositive,
        buttonTextNegative: buttonTextNegative,
        onClickNegative: onClickNegative,
        onClickPositive: onClickPositive,
      ),
    );
  }

  void showMessageSingleButton(
      String errorMessage,
      String buttonTextPositive,
      Function onClickPositive) {
    hideProgress();
    showDialog(
      context: context,
      builder: (BuildContext context) => AppCommonDialogWithSingleButton(
        title: AppString.appName,
        descriptions: errorMessage,
        buttonTextPositive: buttonTextPositive,
        onClickPositive: onClickPositive,
      ),
    );
  }

  @override
  void showErrorWithListener(String errorMessage, Function onPositiveClicked) {
    hideProgress();
    showDialog(
      context: context,
      builder: (BuildContext context) => AppCommonDialog(
        title: AppString.appName,
        descriptions: errorMessage,
        buttonText: AppString.accept,
        onClickPositive: onPositiveClicked,
      ),
    );
  }

  @override
  Future<void>? hideProgress() {
    AppUtils.instance.hideProgress(context);
    return null;
  }

  @override
  Future<void>? showProgress() {
    AppUtils.instance.showProgress(context);
    return null;
  }

  Size screenSize(BuildContext context) {
    return AppUtils.instance.screenSize(context);
  }

  void pushReplacementNamed(BuildContext context, String routeName) {
    hideProgress();
    Navigator.pushReplacementNamed(context, routeName);
  }

  void pushReplacementNamedWithArgument(
      BuildContext context, String routeName, dynamic param) {
    hideProgress();
    Navigator.pushReplacementNamed(context, routeName, arguments: param);
  }

  void pushNamed(BuildContext context, String routeName) {
    hideProgress();
    Navigator.pushNamed(context, routeName);
  }

  void pushNamedWithArgument(
      BuildContext context, String routeName, dynamic param) {
    hideProgress();
    Navigator.pushNamed(context, routeName, arguments: param);
  }

  Future<void> pushNamedWithArgumentWithRetrieveData(BuildContext context,
      String routeName, dynamic param, Function retrieveData) async {
    hideProgress();
    var value = await Navigator.pushNamed(context, routeName, arguments: param);
    retrieveData(value);
  }

  Future<void> pushNamedWithRetrieveData(
      BuildContext context, String routeName, Function retrieveData) async {
    hideProgress();
    var value = await Navigator.pushNamed(
      context,
      routeName,
    );
    retrieveData(value);
  }

  void pushNamedAndRemoveUntil(BuildContext context, String routeName) {
    hideProgress();
    Navigator.pushNamedAndRemoveUntil(context, routeName, (r) => false);
  }

  void pushNamedAndRemoveUntilWithArgument(
      BuildContext context, String routeName, dynamic param) {
    hideProgress();
    Navigator.pushNamedAndRemoveUntil(context, routeName, (r) => false ,arguments: param);
  }

  void pushNamedAndRemoveUntilRoute(
      BuildContext context, String routeName, String removeUntil) {
    hideProgress();
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, ModalRoute.withName(removeUntil));
  }

  void popUntil(BuildContext context, String removeUntil) {
    hideProgress();
    Navigator.popUntil(context, (r) => r.settings.name == removeUntil);
  }

  void pop(BuildContext context) {
    hideProgress();
    Navigator.pop(context);
  }

  void popWithData(BuildContext context, dynamic data) {
    hideProgress();
    Navigator.pop(context, data);
  }

  void popWithSystem(BuildContext context) {
    hideProgress();
    SystemNavigator.pop();
  }


  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }


  Widget getBodyWidget(Size size);

  void afterFirstLayout(BuildContext context);

  bool isDialog() => false;

  SystemUiOverlayStyle getDarkStatusBarTheme(
      {Color statusBarColor = AppColors.black}) {
    if(Platform.isIOS){
      return SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: statusBarColor,
        systemNavigationBarColor: statusBarColor,
        systemNavigationBarDividerColor: statusBarColor,
      );
    } else {
      return SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: statusBarColor,
        systemNavigationBarColor: statusBarColor,
        systemNavigationBarDividerColor: statusBarColor,
      );
    }
  }

  SystemUiOverlayStyle getLightStatusBarTheme(
      {Color statusBarColor = AppColors.white}) {
    if(Platform.isIOS){
      return SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: statusBarColor,
        systemNavigationBarColor: statusBarColor,
        systemNavigationBarDividerColor: statusBarColor,
      );
    } else {
      return SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: statusBarColor,
        systemNavigationBarColor: statusBarColor,
        systemNavigationBarDividerColor: statusBarColor,
      );
    }

  }
}
