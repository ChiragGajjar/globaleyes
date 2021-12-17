import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:globaleyes/common_imports.dart';


class AppUtils {
  AppUtils._privateConstructor();

  static final AppUtils instance = AppUtils._privateConstructor();

  bool _isProgressDialogShowing = false;

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  void showProgress(BuildContext context) {
    if (!_isProgressDialogShowing) {
      _isProgressDialogShowing = !_isProgressDialogShowing;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return WillPopScope(
              onWillPop: () => Future.value(false),
              child: SimpleDialog(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(),
                    ],
                  ),
                ],
              ),
            );
          });
        },
      );
    }
  }

  void hideProgress(BuildContext context) {
    if (_isProgressDialogShowing) {
      _isProgressDialogShowing = !_isProgressDialogShowing;
      Navigator.of(context).pop();
    }
  }

  Size screenSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }

  double screenHeight(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).height - reducedBy) / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  double screenHeightExcludingToolbar(BuildContext context,
      {double dividedBy = 1}) {
    return screenHeight(context,
        dividedBy: dividedBy, reducedBy: kToolbarHeight);
  }

  // double screenHeightExcludingToolbar(BuildContext context,
  //     {double dividedBy = 1}) {
  //   return screenHeight(context,
  //       dividedBy: dividedBy, reducedBy: Scaffold.maybeOf(context).appBarMaxHeight);
  // }


  String convertDate(String date){
    if (date.isNullOrEmpty()) {
      return '-';
    }else {
      var parsedDate = DateTime.parse(date);
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formatted = formatter.format(parsedDate);
      print(formatted); // something like 20/04/2013
      return formatted;
    }
  }
}
