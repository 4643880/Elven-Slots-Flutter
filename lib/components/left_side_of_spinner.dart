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
    return GetBuilder<BetController>(
      builder: (controller) => Container(
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
              width: 23.w,
            ),
            Expanded(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setValue(false);
                          },
                          child: SizedBox(
                            height: 25.h,
                            width: 25.w,
                            child: Image.asset("assets/images/decrement.png"),
                          ),
                        ),
                        Text(
                          controller.getValue.toString(),
                          style: TextStyle(
                            fontFamily: "Morris",
                            fontSize: 22.sp,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setValue(true);
                          },
                          child: SizedBox(
                            height: 25.h,
                            width: 25.w,
                            child: Image.asset("assets/images/increment.png"),
                          ),
                        ),
                      ],
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
          ],
        ),
      ),
    );
  }
}
