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
    // GameController gameController = GameController();
    // BetController betController = BetController();
    return GetBuilder<BetController>(
      builder: (betController) => GetBuilder<GameController>(
        builder: (gameController) => GestureDetector(
          onTap: () async {
            if (gameController.getYouWinScreenValue == false) {
              if (gameController.getAutoStart == false) {
                if (gameController.getProgressLoopSingleIteration == false) {
                  gameController.setProgressSingleIteration(true);
                  await spinNineTimes();
                  gameController.setProgressSingleIteration(false);
                }
              } else {
                if (gameController.getProgressLoop == false) {
                  gameController.setProgressLoop(true);
                  gameController.setSwitchButton(true);
                  if (betController.getValue >= 5) {
                    betController.setRemainingAmount();
                    while (
                        gameController.getAutoStart == gameController.getTemp) {
                      gameController.setSwitchButton(true);
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
                      gameController.setSwitchButton(false);
                    }
                    gameController.setProgressLoop(false);
                  } else {
                    Get.snackbar(
                      "Increase Value",
                      "Please increase the value for bet!",
                      backgroundColor: const Color(0xff7DCE06),
                      colorText: Colors.white,
                    );
                  }
                  // gameController.setSwitchButton(false);
                }
              }
            }

            // unlimited iteration
            // if (betController.getValue >= 5) {
            //   gameController.setAutoStart(true);
            //   gameController.setSwitchButton(true);
            //   betController.setRemainingAmount();

            //   while (gameController.getAutoStart == gameController.getTemp) {
            //     // First Nine Iterations Starts Here
            //     for (int i = 0; i < 9; i++) {
            //       await gameController.shuffleItems();
            //       await Future.delayed(
            //         const Duration(milliseconds: 300),
            //       );
            //       if (gameController.getTemp == false) {
            //         break;
            //       }
            //     }
            //     final res = await gameController.checkWin();
            //     if (res == false) {
            //       gameController.setAutoStart(true);
            //       // devtools.log("Reached 1");
            //     } else {
            //       gameController.setAutoStart(false);
            //       // gameController.setPrizeValue(0);
            //       // devtools.log("Reached 2");
            //     }
            //     print(res);
            //     // First Nine Iterations Ends Here
            //     betController.setRemainingAmount();
            //     if (gameController.getTemp == false) {
            //       break;
            //     }
            //   }
            // } else {
            //   Get.snackbar(
            //     "Increase Value",
            //     "Please increase the value for bet!",
            //     backgroundColor: const Color(0xff7DCE06),
            //     colorText: Colors.white,
            //   );
            // }
          },
          child: Image.asset(
            "assets/images/button.png",
            height: 90.h,
            width: 90.w,
          ),
        ),
      ),
    );
  }
}
