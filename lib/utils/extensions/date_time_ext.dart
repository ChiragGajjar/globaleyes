import 'package:globaleyes/utils/extensions/numbers_ext.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toStringYYYYMMDD([String separator = "/"]) {
    return "${year.toString()}$separator${month.toStringTwoDigit()}$separator${day.toStringTwoDigit()}";
  }

  String toStringMMDDYYYY([String separator = "/"]) {
    return "${month.toStringTwoDigit()}$separator${day.toStringTwoDigit()}$separator${year.toString()}";
  }

  String toStringMMYY([String separator = "/"]) {
    return DateFormat('MM/yy').format(this);
  }

  DateTime copyWith(
      {int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  int compareToDate(DateTime dateCalendar) {
    var sdf = DateFormat("yyyy/MM/dd");
    var date1 = sdf.format(this);
    var date2 = sdf.format(dateCalendar);
    var i = date1.compareTo(date2);
    return i;
  }
}
