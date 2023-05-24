import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:eleven_slots/helper/extra_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpinnerButton extends StatelessWidget {
  const SpinnerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        spinNineTimes();
      },
      child: Image.asset(
        "assets/images/button.png",
        height: 90.h,
        width: 90.w,
      ),
    );
  }
}
