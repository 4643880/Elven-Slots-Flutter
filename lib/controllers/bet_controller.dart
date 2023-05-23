import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BetController extends GetxController {
  // int _dataBaseAmount = 500;
  int _remainingAmount = 500000;
  // int get getDataBaseAmount => _dataBaseAmount;
  int get getRemainingAmount => _remainingAmount;

  int _value = 0;
  // int _winAmount = 0;
  int get getValue => _value;
  // int get getWinAmount => _winAmount;

  setValue(bool value) {
    if (value == true) {
      if (_value < 50) {
        _value += 5;
      } else {
        _value = 0;
      }
      // _winAmount += 1250;
    } else {
      if (_value > 5) {
        _value -= 5;
        // _winAmount -= 1250;
      }
    }
    update();
  }

  void setRemainingAmount() {
    _remainingAmount = getRemainingAmount - getValue;
    // print("Remaining " + _remainingAmount.toString());
    update();
  }
}
