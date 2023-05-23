import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LeftSizeOfSpinnerWithCounter extends StatelessWidget {
  const LeftSizeOfSpinnerWithCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 110.h,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(8).r,
          bottomRight: const Radius.circular(8).r,
        ),
      ),
      child: Row(
        children: [
          Container(
            // color: Colors.white,
            width: 23.w,
          ),
          GetBuilder<BetController>(
            builder: (controller) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3, right: 4).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "bet",
                      style: TextStyle(
                        fontFamily: "Morris",
                        fontSize: 22.sp,
                        color: const Color(0xff96D700),
                      ),
                    ),
                    // Counter
                    Container(
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.setValue(false);
                              print(controller.getValue.toString());
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              child: Image.asset("assets/images/decrement.png"),
                            ),
                          ),
                          GetBuilder<BetController>(
                            builder: (controller) => Text(
                              controller.getValue.toString(),
                              style: TextStyle(
                                fontFamily: "Morris",
                                fontSize: 22.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setValue(true);
                              print(controller.getValue.toString());
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              child: Image.asset("assets/images/increment.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 05,
                        vertical: 02,
                      ).r,
                      // color: Colors.red,
                      child: Image.asset("assets/images/maxBet.png"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
