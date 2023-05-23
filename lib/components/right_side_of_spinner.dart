import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RightSizeOfSpinnerWithCounter extends StatelessWidget {
  const RightSizeOfSpinnerWithCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (controller) => Container(
        height: 90.h,
        width: 110.h,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(8).r,
            bottomLeft: const Radius.circular(8).r,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3, left: 4).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "win",
                      style: TextStyle(
                        fontFamily: "Morris",
                        fontSize: 18.sp,
                        color: const Color(0xff96D700),
                      ),
                    ),
                    // Counter
                    Container(
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GetBuilder<GameController>(
                            builder: (controller) => Text(
                              // "\$ ${controller.getWinAmount}",
                              "\$ ${controller.getPrizeValue.toString()}",
                              style: TextStyle(
                                fontFamily: "Morris",
                                fontSize: 22.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (controller.getAutoStart == false) {
                          controller.setAutoStart(true);
                          for (int i = 0; i < 1000; i++) {
                            await controller.shuffleItems();
                            await Future.delayed(
                              const Duration(milliseconds: 300),
                            );
                            if (controller.getAutoStart == true) {
                              continue;
                            } else {
                              break;
                            }
                          }
                        }
                        if (controller.getAutoStart == true) {
                          controller.setAutoStart(false);
                          for (int i = 0; i <= 1; i++) {
                            await controller.shuffleItems();
                            await Future.delayed(
                              const Duration(microseconds: 300),
                            );
                            break;
                          }
                        }
                      },
                      child: Column(
                        children: [
                          controller.getAutoStart == false
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 05,
                                    vertical: 02,
                                  ).r,
                                  // color: Colors.red,
                                  child: Image.asset("assets/images/off.png"),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 05,
                                    vertical: 02,
                                  ).r,
                                  // color: Colors.red,
                                  child: Image.asset("assets/images/on.png"),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // color: Colors.white,
              width: 23.w,
            ),
          ],
        ),
      ),
    );
  }
}
