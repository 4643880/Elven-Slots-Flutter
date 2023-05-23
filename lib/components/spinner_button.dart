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
    return GetBuilder<GameController>(
      builder: (controller) => GestureDetector(
        onTap: () async {
          await controller.shuffleItems();
          controller.checkWin();
          // print("clicking");
        },
        child: Image.asset(
          "assets/images/button.png",
          height: 90.h,
          width: 90.w,
        ),
      ),
    );
  }
}
