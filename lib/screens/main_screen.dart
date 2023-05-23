import 'package:eleven_slots/components/build_item_widget.dart';
import 'package:eleven_slots/components/custom_background.dart';
import 'package:eleven_slots/components/left_side_of_spinner.dart';
import 'package:eleven_slots/components/right_side_of_spinner.dart';
import 'package:eleven_slots/components/spinner_button.dart';
import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController myController = GameController();
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Positioned(
            top: 55.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/mute.png",
                  height: 25.h,
                  width: 25.w,
                ),
                SvgPicture.asset(
                  "assets/images/Logo.svg",
                  height: 70,
                ),
                Image.asset(
                  "assets/images/dollar.png",
                  height: 25.h,
                  width: 25.w,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 230 + 280.h,
            left: 140,
            right: 140,
            child: Container(
              height: 55.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10).r,
                  topRight: const Radius.circular(10).r,
                ),
                color: Colors.black38,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 8, left: 8).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "balance",
                      style: TextStyle(
                        fontFamily: "Morris",
                        fontSize: 18.sp,
                        color: const Color(0xff96D700),
                      ),
                    ),
                    GetBuilder<GameController>(
                      builder: (controller) => Text(
                        "\$ ${controller.getScore.toString()}",
                        style: TextStyle(
                          fontFamily: "Morris",
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 230,
            left: 0,
            right: 0,
            child: Container(
              height: 280.h,
              width: 280.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/component1.png"),
                ),
              ),
              child: Container(
                height: 250.h,
                width: 250.w,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2).r,
                      child: GetBuilder<GameController>(
                        builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuildItemWidget(item: controller.getItem1!),
                            BuildItemWidget(item: controller.getItem2!),
                            BuildItemWidget(item: controller.getItem3!),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5).r,
                      child: GetBuilder<GameController>(
                        builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuildItemWidget(item: controller.getItem4!),
                            BuildItemWidget(item: controller.getItem5!),
                            BuildItemWidget(item: controller.getItem6!),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7).r,
                      child: GetBuilder<GameController>(
                        builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuildItemWidget(item: controller.getItem7!),
                            BuildItemWidget(item: controller.getItem8!),
                            BuildItemWidget(item: controller.getItem9!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Side
                const LeftSizeOfSpinnerWithCounter(),
                // Button
                const SpinnerButton(),
                // Right Size
                const RightSizeOfSpinnerWithCounter(),
                // Container(
                //   height: 90.h,
                //   width: 110.h,
                //   decoration: BoxDecoration(
                //     color: Colors.black54,
                //     borderRadius: BorderRadius.only(
                //       topLeft: const Radius.circular(8).r,
                //       bottomLeft: const Radius.circular(8).r,
                //     ),
                //   ),
                //   child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Text(
                //           "win",
                //           style: TextStyle(
                //             fontFamily: "Morris",
                //             fontSize: 18.sp,
                //             color: const Color(0xff96D700),
                //           ),
                //         ),
                //       ]),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}