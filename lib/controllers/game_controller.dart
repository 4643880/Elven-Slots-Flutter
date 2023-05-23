import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:eleven_slots/config/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GameController extends GetxController {
  late String _item1,
      _item2,
      _item3,
      _item4,
      _item5,
      _item6,
      _item7,
      _item8,
      _item9;

  int _score = 0;

  int get getScore => _score;
  String? get getItem1 => _item1;
  String? get getItem2 => _item2;
  String? get getItem3 => _item3;
  String? get getItem4 => _item4;
  String? get getItem5 => _item5;
  String? get getItem6 => _item6;
  String? get getItem7 => _item7;
  String? get getItem8 => _item8;
  String? get getItem9 => _item9;

  List<String> items = [
    "assets/images/item1.png",
    "assets/images/item2.png",
    "assets/images/item3.png",
    "assets/images/item4.png",
    "assets/images/item5.png",
    "assets/images/item6.png",
    "assets/images/item7.png",
    "assets/images/item8.png",
    "assets/images/item9.png",
  ];

  Future<void> shuffleItems() async {
    _item1 = items[Random().nextInt(items.length)];
    update();
    _item2 = items[Random().nextInt(items.length)];
    update();
    _item3 = items[Random().nextInt(items.length)];
    update();
    _item4 = items[Random().nextInt(items.length)];
    update();
    _item5 = items[Random().nextInt(items.length)];
    update();
    _item6 = items[Random().nextInt(items.length)];
    update();
    _item7 = items[Random().nextInt(items.length)];
    update();
    _item8 = items[Random().nextInt(items.length)];
    update();
    _item9 = items[Random().nextInt(items.length)];
    update();
  }

  void checkWin() async {
    if ((_item1 == _item2 && _item2 == _item3) ||
        (_item4 == _item5 && _item5 == _item6) ||
        (_item7 == _item8 && _item8 == _item9) ||
        (_item1 == _item4 && _item4 == _item7) ||
        (_item2 == _item5 && _item5 == _item8) ||
        (_item3 == _item6 && _item6 == _item9) ||
        (_item1 == _item5 && _item5 == _item9) ||
        (_item3 == _item5 && _item5 == _item7)) {
      update();
      final player = AudioPlayer();
      await player.play(AssetSource("sounds/riseup.mp3"));

      _score += 10000;
      update();
    } else {
      final player = AudioPlayer();
      await player.play(AssetSource("sounds/spin.mp3"));
    }
  }

  @override
  void onInit() async {
    await shuffleItems();
    update();
    super.onInit();
  }
}