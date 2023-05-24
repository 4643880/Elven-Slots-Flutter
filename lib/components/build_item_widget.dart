import 'package:flutter/material.dart';

class BuildItemWidget extends StatelessWidget {
  final String item;
  const BuildItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset(item),
    );
  }
}
