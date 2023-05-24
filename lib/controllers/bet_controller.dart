import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BetController extends GetxController {
  int _remainingAmount = 500000;
  int get getRemainingAmount => _remainingAmount;

  int _value = 0;
  int get getValue => _value;

  setValue(bool value) {
    if (value == true) {
      if (_value < 50) {
        _value += 5;
      } else {
        _value = 0;
      }
    } else {
      if (_value > 5) {
        _value -= 5;
      }
    }
    update();
  }

  void setRemainingAmount() {
    _remainingAmount = getRemainingAmount - getValue;
    update();
  }
}
