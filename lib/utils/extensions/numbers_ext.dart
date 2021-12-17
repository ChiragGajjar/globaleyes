extension NumExtensions on int {

  String toStringTwoDigit() {
    assert(this < 100 && this > -100);

    String sign = this < 0 ? "-" : "";
    num value = abs();
    String placeHolder = value < 10 ? "0" : "";

    return "$sign$placeHolder$value";
  }

  String toStringTwoDigitInt() {
    return toString().padLeft(2, '0');
  }
}