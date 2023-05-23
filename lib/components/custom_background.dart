import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
        image: AssetImage("assets/images/bg.png"),
        fit: BoxFit.cover,
      )),
      child: Container(),
    );
  }
}
