import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bet_controller.dart';
import '../controllers/game_controller.dart';

Future<void> spinNineTimes() async {
  BetController betController = Get.find();
  GameController gameController = Get.find();
  if (betController.getValue >= 5) {
    if (gameController.getSwitchButton == false) {
      if (gameController.getYouWinScreenValue == false) {
        betController.setRemainingAmount();
      }
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItemsTemporary();
      await Future.delayed(const Duration(milliseconds: 300));
      await gameController.shuffleItems();
      await Future.delayed(const Duration(milliseconds: 300));

      gameController.checkWin();
      // print("clicking");
    }
  } else {
    Get.snackbar(
      "Increase Value",
      "Please increase the value for bet!",
      backgroundColor: const Color(0xff7DCE06),
      colorText: Colors.white,
    );
  }
}
