import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;

class RightSizeOfSpinnerWithCounter extends StatelessWidget {
  const RightSizeOfSpinnerWithCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetController>(
      builder: (betController) => GetBuilder<GameController>(
        builder: (gameController) => Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            // "\$ ${controller.getWinAmount}",
                            "\$ ${gameController.getPrizeValue.toString()}",
                            style: TextStyle(
                              fontFamily: "Morris",
                              fontSize: 22.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTapCancel: () {},
                        onTap: () async {
                          if (gameController.getYouWinScreenValue == false) {
                            if (gameController.getAutoStart == false) {
                              gameController.setAutoStart(true);
                              gameController.setTemp(true);
                              gameController.setSwitchButton(true);
                            } else {
                              gameController.setAutoStart(false);
                            }
                            print(gameController.getAutoStart);
                          }
                        },
                        child: Column(
                          children: [
                            gameController.getAutoStart == false
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
                width: 23.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
