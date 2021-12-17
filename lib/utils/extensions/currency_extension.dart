extension CurrencyExtension on double {

  String toAppendCurrency() {

    return "\$${toStringAsFixed(2)}";
  }

String toAppendCurrencyWithMinus() {

    return "- \$${toStringAsFixed(2)}";
  }
}
