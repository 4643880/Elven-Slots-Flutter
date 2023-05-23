import 'package:eleven_slots/components/custom_background.dart';
import 'package:eleven_slots/config/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        Future.delayed(const Duration(seconds: 2), () {
          Get.toNamed(RouteHelper.routeMainScreen);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Positioned(
            top: 55.h,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/Logo.svg",
              height: 70,
            ),
          ),
          Positioned(
            bottom: 230,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/elves.png",
              height: 200.h,
              width: 200.w,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "loading...",
                style: TextStyle(
                  color: const Color(0xff96D700),
                  fontFamily: 'Morris',
                  fontSize: 25.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
