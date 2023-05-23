import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightSizeOfSpinnerWithCounter extends StatelessWidget {
  const RightSizeOfSpinnerWithCounter({
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
                        Text(
                          "\$ ${0}",
                          style: TextStyle(
                            fontFamily: "Morris",
                            fontSize: 22.sp,
                            color: Colors.white,
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
                    child: Image.asset("assets/images/off.png"),
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
    );
  }
}
