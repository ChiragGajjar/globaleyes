import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:globaleyes/shared/dialogs/app_common_dialog.dart';

import '../../../common_imports.dart';
import '../bottom_sheet_list.dart';

// ignore: must_be_immutable
class CustomTxtFieldWithBtn extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction action;
  int maxLine = 1;
  double fontSize;
  String fontFamily;
  String hintText;
  bool isRequired;
  bool isEditing;
  FocusNode myFocusNode;
  VoidCallback onPress;

  CustomTxtFieldWithBtn({
    required this.controller,
    required this.inputType,
    required this.action,
    required this.maxLine,
    this.fontSize = 12,
    required this.fontFamily,
    this.hintText = '',
    required this.myFocusNode,
    this.isRequired = false,
    this.isEditing = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        buildCounter: (BuildContext context,
            {required currentLength, required maxLength, required bool isFocused}) =>
        null,
        autofocus: false,
        keyboardType: inputType,
        textInputAction: action,
        controller: controller,
        maxLines: 1,
        obscureText: false,
        maxLength: 55,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        // focusNode: myFocusNode,
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
                BorderSide(width: 1.w, color: AppColors.greyBorderColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color: AppColors.appThemeColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
          suffixIcon: Container(
              margin: EdgeInsets.all(10),
              width: 75.w,
              child: CustomButton(
                isEditing ? AppString.upSubCat : AppString.addSubCat,
                fontSize: 14,
                height: 35,
                onPress: () {
                  onPress();
                },
              )),
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

class CustomDropDownTextField<T> extends StatelessWidget {
  CustomDropDownTextField({
    Key? key,
    required this.controller,
    required this.inputType,
    required this.hint,
    required this.data,
    required this.getTextFromModel,
    required this.onSelect,
    required this.state,
    this.notValid: false,
    this.notValidMsg: '',
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final List<T> data;
  final BaseStatefulWidgetState state;
  final GetTextFromModel<T> getTextFromModel;
  final Function onSelect;
  final bool notValid;
  final String notValidMsg;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: AlwaysDisabledFocusNode(),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        if (notValid) {
          state.showError(notValidMsg);
          return;
        }
        BottomSheetList.showBottomSheet<T>(
          state: state,
          list: data,
          getTextFromModel: getTextFromModel,
          onSelect: onSelect,
        );
      },
      controller: controller,
      autofocus: false,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      obscureText: false,
      cursorColor: AppColors.appThemeColor,
      style: const TextStyle(
        fontFamily: FontsFamily.GilroyRegular,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.white
      ),
      decoration: InputDecoration(
        hintText: 'Click to Select Department',
        hintStyle: const TextStyle(color: AppColors.white),
        labelStyle: const TextStyle(
          color: AppColors.lightGrayFontColor,
          fontFamily: FontsFamily.GilroyRegular,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: Container(
          padding: EdgeInsets.only(left: 10.w),
          child: const Icon(Icons.keyboard_arrow_down),
        ),
      ),
    );
  }
}

class CustomTimePickerTextField extends StatelessWidget {
  const CustomTimePickerTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.isDatePicker: false,
    required this.valueSelected,
    required this.valueSelected2,
    this.isCurrentLast: false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool isDatePicker;
  final bool isCurrentLast;
  final ValueChanged<String> valueSelected;
  final ValueChanged<String> valueSelected2;

  void _getTimePicker(BuildContext context) async {
    var time = controller.text.getHoursMinutes();
    var selectedTime = await showTimePicker(
      initialTime: TimeOfDay(hour: time.first, minute: time.last),
      context: context,
    );
    print(selectedTime!.format(context));
    String value = selectedTime.hour.toStringTwoDigit() +
        ':' +
        selectedTime.minute.toStringTwoDigit();
    controller.text = value.convertTo12HrsFormat();
    valueSelected(value);
  }

  void _getDatePicker(BuildContext context) async {
    var selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1901, 1),
      lastDate: isCurrentLast ? DateTime.now() : DateTime(2100),
      context: context,
    );
    String date = selectedDate!.day.toStringTwoDigit() +
        '/' +
        selectedDate.month.toStringTwoDigit() +
        '/' +
        selectedDate.year.toString();
    String date2 = selectedDate.year.toString() +
        '-' +
        selectedDate.month.toStringTwoDigit() +
        '-' +
        selectedDate.day.toStringTwoDigit();

    controller.text = date;
    valueSelected(date);
    // valueSelected2(date2);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: AlwaysDisabledFocusNode(),
      onTap: () {
        if (isDatePicker) {
          _getDatePicker(context);
        } else {
          _getTimePicker(context);
        }
      },
      controller: controller,
      autofocus: false,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      obscureText: false,
      cursorColor: AppColors.appThemeColor,
      style: TextStyle(
        fontFamily: FontsFamily.GilroyRegular,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: hint,
        hintStyle: const TextStyle(color: AppColors.lightGrayFontColor),
        labelStyle: const TextStyle(
          color: AppColors.lightGrayFontColor,
          fontFamily: FontsFamily.GilroyRegular,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: AppColors.greyBorderColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: AppColors.appThemeColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        suffixIcon: Container(
          padding: EdgeInsets.only(top:16.h, bottom: 16.h, left: 16.w, right: 16.w),
          child: Image(
            image: isDatePicker ? AppImages.icCalendar : AppImages.icClock,
            width: 13.w,
            height: 13.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class CustomTimePickerTextField2 extends StatelessWidget {
  CustomTimePickerTextField2(
      {Key? key,
      required this.controller,
      required this.hint,
      this.isDatePicker = false,
      required this.valueSelected,
      required this.valueSelectedDate,
      this.currentTime,
      required this.businessOpenDt,
      required this.dateMatchedValue,
      required this.initialDateSelected,
      this.fromTo = false});

  final TextEditingController controller;
  final String hint;
  final String businessOpenDt;
  final bool isDatePicker;
  final DateTime initialDateSelected;
  final bool dateMatchedValue;
  final ValueChanged<String> valueSelected;
  final ValueChanged<DateTime> valueSelectedDate;
  final currentTime;
  bool dateMatched = false;
  bool fromTo;
  final ValueNotifier<DateTime> _dateTimeNotifier =
      ValueNotifier<DateTime>(DateTime.now());

  void _getTimePicker(BuildContext context) async {
    var selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    print(selectedTime!.format(context));
    String time = selectedTime.hour.toStringTwoDigit() +
        ':' +
        selectedTime.minute.toStringTwoDigit();

    controller.text = time;
    valueSelected(time);
  }

  void _getTimePickerTo(BuildContext context) async {
    var selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,

    );
    print(selectedTime!.format(context));
    String time = selectedTime.hour.toStringTwoDigit() +
        ':' +
        selectedTime.minute.toStringTwoDigit();
/*
    if (dateMatchedValue) {
    //    date matched true
    } else {

    }*/

    controller.text = time;
    valueSelected(time);
  }

  void _getDatePicker(BuildContext context) async {
    var selectedDate = await showDatePicker(
      initialDate: initialDateSelected,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(hours: 72)),
      context: context,
    ).then((dateTime) async => _dateTimeNotifier.value = dateTime!);

    print('selectedDate $selectedDate');

    /*  if (selectedDate != null && selectedDate != selectedDate) {
      setState(() {
        selectedDate = selectedDate;
        _date.value = TextEditingValue(text: selectedDate.toString());
      });
    }*/

    var selectedDatevalue = DateTime.utc(
        selectedDate.year, selectedDate.month, selectedDate.day);
    var currentDatevalue = DateTime.now();

    if (selectedDatevalue.compareTo(currentDatevalue) > 0) {
      print('selectedDate1 $selectedDate');
      // DateTime.now().add(Duration(hours: 72)
      dateMatched = false;
    } else {
      //both date are matched
      dateMatched = true;
      print('selectedDate2 $selectedDate');
    }
    // print('currenttime $DateTime.now()');
    String date2 = selectedDate.year.toString() +
        '-' +
        selectedDate.month.toStringTwoDigit() +
        '-' +
        selectedDate.day.toStringTwoDigit();

    controller.text = date2.convertDateForUI();
    valueSelectedDate(selectedDatevalue);
    // valueSelected2(date2);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: AlwaysDisabledFocusNode(),
      onTap: () {
        if (isDatePicker) {
          _getDatePicker(context);
        } else {
          if (!businessOpenDt.isNullOrEmpty()) {
            if (fromTo) {
              _getTimePickerTo(context);
            } else {
              _getTimePicker(context);
            }
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) => const AppCommonDialog(
                title: AppString.appName,
                descriptions: "Please first select date",
                buttonText: AppString.accept,
              ),
            );
          }
        }
      },
      controller: controller,
      autofocus: false,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      obscureText: false,
      cursorColor: AppColors.appThemeColor,
      style: const TextStyle(
        fontFamily: FontsFamily.GilroyRegular,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: hint,
        hintStyle: const TextStyle(color: AppColors.lightGrayFontColor),
        labelStyle: const TextStyle(
          color: AppColors.lightGrayFontColor,
          fontFamily: FontsFamily.GilroyRegular,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.greyBorderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.appThemeColor),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: Container(
          padding: const EdgeInsets.all(15),
          child: Image(
            image: isDatePicker ? AppImages.icCalendar : AppImages.icClock,
            width: 10,
            height: 10,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('currentTime', currentTime));
  }
}

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.isDatePicker: false,
      this.valueSelected})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool isDatePicker;
  final ValueChanged<String>? valueSelected;

  void _getTimePicker(BuildContext context) async {
    var selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    print(selectedTime!.format(context));
    String time = selectedTime.hour.toStringTwoDigit() +
        ':' +
        selectedTime.minute.toStringTwoDigit();
    controller.text = time;
    valueSelected!(time);
  }

  void _getDatePicker(BuildContext context) async {
    var selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100),
      context: context,
    );
    String date = selectedDate!.day.toStringTwoDigit() +
        '/' +
        selectedDate.month.toStringTwoDigit() +
        '/' +
        selectedDate.year.toString();

    controller.text = date;
    valueSelected!(date);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: AlwaysDisabledFocusNode(),
      onTap: () {
        if (isDatePicker) {
          _getDatePicker(context);
        } else {
          _getTimePicker(context);
        }
      },
      controller: controller,
      autofocus: false,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      obscureText: false,
      cursorColor: AppColors.appThemeColor,
      style: const TextStyle(
        fontFamily: FontsFamily.GilroyRegular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        labelText: hint,
        hintStyle: const TextStyle(color: AppColors.lightGrayFontColor),
        labelStyle: const TextStyle(
          color: AppColors.appThemeColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.greyBorderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.appThemeColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
