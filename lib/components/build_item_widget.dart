import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildItemWidget extends StatelessWidget {
  final String item;
  const BuildItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (controller) => Container(
        height: 100,
        width: 100,
        child: Image.asset(item),
      ),
    );
  }
}
