import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

}