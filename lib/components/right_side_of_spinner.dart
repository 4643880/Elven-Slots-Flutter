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
                          // gameController.setTemp(true);
                          // gameController.setAutoStart(false);
                          if (gameController.getSwitchButton == false) {
                            if (gameController.getYouWinScreenValue == false) {
                              if (betController.getValue >= 5) {
                                gameController.setAutoStart(true);
                                gameController.setSwitchButton(true);
                                betController.setRemainingAmount();

                                while (gameController.getAutoStart ==
                                    gameController.getTemp) {
                                  // First Nine Iterations Starts Here
                                  for (int i = 0; i < 9; i++) {
                                    await gameController.shuffleItems();
                                    await Future.delayed(
                                      const Duration(milliseconds: 300),
                                    );
                                    if (gameController.getTemp == false) {
                                      break;
                                    }
                                  }
                                  final res = await gameController.checkWin();
                                  if (res == false) {
                                    gameController.setAutoStart(true);
                                    // devtools.log("Reached 1");
                                  } else {
                                    gameController.setAutoStart(false);
                                    // gameController.setPrizeValue(0);
                                    // devtools.log("Reached 2");
                                  }
                                  print(res);
                                  // First Nine Iterations Ends Here
                                  betController.setRemainingAmount();
                                  if (gameController.getTemp == false) {
                                    break;
                                  }
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
                          }
                          // else {
                          //   // gameController.setAutoStart(false);
                          //   gameController.setAutoStart(false);
                          //   // gameController.setSwitchButton(false);
                          //   gameController.setTemp(false);
                          //   devtools.log("Reached IN Else");
                          // }

                          // gameController.setAutoStart(false);
                          // gameController.setTemp(true);

                          // if (gameController.getAutoStart == true) {
                          //   gameController.setAutoStart(false);
                          //   for (int i = 0; i <= 1; i++) {
                          //     await gameController.shuffleItems();
                          //     await Future.delayed(
                          //       const Duration(microseconds: 300),
                          //     );
                          //     // controller.checkWin();
                          //     break;
                          //   }
                          // }
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
