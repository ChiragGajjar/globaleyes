import 'package:globaleyes/common_imports.dart';
import 'package:intl/intl.dart';

extension StringExt on String {
  bool isDoubleValid() {
    if (isNullOrEmpty()) {
      return false;
    }
    return double.tryParse(this) != null;
  }

  bool isEmailValid() {
      return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(this);
  }

  bool isUrlValid() {
    return Uri.parse("https://google.com/").host == '' ? false : true;

  }

  bool isDateValid() {
    var now = DateTime.now();
    return toInt() <= now.year && toInt() >= 1000 ;
  }

  bool isPasswordValid() {
      // return RegExp(
      //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
      //     .hasMatch(this);
    return length >= 6 && length <= 10;
  }
  bool isPasswordValidLength() {
    return length <= 10;
  }

  bool isContactNumberLength() {
    return length <= 4;
  }

  bool isDigit(){
   return RegExp(r'^-?[0-9]+$').hasMatch(this);
  }

  bool isNullOrEmpty(){
    return (isEmpty) ? true : false;
  }

  bool isNotNullOrEmpty(){
    return !isNullOrEmpty();
  }

  double toDouble(){
    return double.tryParse(this) ?? 0.0;
  }

  int toInt(){
    return int.tryParse(this) ?? 0;
  }

  String toAppendCurrency() {
    return "\$$this";
  }

  String convertMMDDYYYYToYYYYMMDD(){
    if(isEmpty){
      return '';
    }else {
      final DateFormat inputDateFormat = DateFormat('MM/dd/yyyy');
      final DateTime now = inputDateFormat.parse(this);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      return formatted;
    }
  }


  String changeToReservationDateFormat(){
      var input = DateFormat('yyyy-MM-dd');
      var output = DateFormat('dd MMMM yyyy');
      var date = input.parse(this);
      return output.format(date);
  }

  String lastTwoDigit({int last : 2}){
    var value = double.parse((this)).toStringAsFixed(last);
    return value;
  }

String changeToReservationTimeFormat(){
      var input = DateFormat('HH:mm:ss');
      var output = DateFormat('hh:mm aa');
      var date = input.parse(this);
      return output.format(date);
  }

  String convertTo12HrsFormat() {
    if (isNullOrEmpty()) {
      return '';
    }
    var fromTimes = split(':');
    var fromHr = fromTimes[0].toInt();
    var fromMin = fromTimes[1].toInt();
    final now = DateTime.now();
    var selectedDt = DateTime(now.year, now.month, now.day, fromHr, fromMin);
    DateFormat formatter = DateFormat('jm');
    var formatted = formatter.format(selectedDt);
    return formatted;
  }

  List<int> getHoursMinutes() {
    if (isNullOrEmpty()) {
      var now = TimeOfDay.now();
      return [now.hour, now.minute];
    }
    var time = split(':');
    var hr = time.first.replaceAll(RegExp(r'[^0-9]'),'');
    var min = time.last.replaceAll(RegExp(r'[^0-9]'),'');
    return [hr.toInt(), min.toInt()];
  }

  /// trims leading whitespace
  String ltrim() {
    return isNotNullOrEmpty() ? replaceFirst(RegExp(r"^\s+"), "") : '';
  }

  /// trims trailing whitespace
  String rtrim() {
    return replaceFirst(RegExp(r"\s+$"), "");
  }

  String convertDateForUI() {
    var dtArr = split('-');
    var year = dtArr[0];
    var month = dtArr[1];
    var day = dtArr[2];
    return '$day/$month/$year';
  }

  String convertDateForApi() {
    var dtArr = split('/');
    var year = dtArr[2];
    var month = dtArr[1];
    var day = dtArr[0];
    return '$year-$month-$day';
  }

}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}