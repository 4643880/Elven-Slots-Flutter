import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpinnerButton extends StatelessWidget {
  const SpinnerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BetController betController = Get.find();
    GameController controller = Get.find();
    return GestureDetector(
      onTap: () async {
        if (betController.getValue >= 5) {
          betController.setRemainingAmount();
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          await controller.shuffleItems();
          await Future.delayed(const Duration(milliseconds: 300));
          controller.checkWin();
          // print("clicking");
        } else {
          Get.snackbar(
            "Increase Value",
            "Please increase the value for bet!",
            backgroundColor: const Color(0xff7DCE06),
            colorText: Colors.white,
          );
        }
      },
      child: Image.asset(
        "assets/images/button.png",
        height: 90.h,
        width: 90.w,
      ),
    );
  }
}
