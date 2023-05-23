import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:eleven_slots/config/route.dart';
import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:eleven_slots/controllers/sound_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GameController extends GetxController {
  SoundController soundController = Get.find();
  BetController betController = Get.find();

  bool _autoStart = false;
  bool get getAutoStart => _autoStart;
  setAutoStart(bool value) {
    _autoStart = value;
    update();
  }

  bool _winner = false;
  bool get getWinner => _winner;
  setWinner(bool value) {
    _winner = value;
    update();
  }

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

  List<int> myPrizeValues = [25, 50, 75, 100, 25, 50, 25, 50];
  late int _prizeValue = 0;
  int get getPrizeValue => _prizeValue;

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
    _item2 = items[Random().nextInt(items.length)];
    _item3 = items[Random().nextInt(items.length)];
    _item4 = items[Random().nextInt(items.length)];
    _item5 = items[Random().nextInt(items.length)];
    _item6 = items[Random().nextInt(items.length)];
    _item7 = items[Random().nextInt(items.length)];
    _item8 = items[Random().nextInt(items.length)];
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
      if (soundController.getIsMute == true) {
        final player = AudioPlayer();
        player.setVolume(0);
        await player.play(AssetSource("sounds/riseup.mp3"));
      } else {
        final player = AudioPlayer();
        player.setVolume(1);
        await player.play(AssetSource("sounds/riseup.mp3"));
      }

      _prizeValue =
          _prizeValue + myPrizeValues[Random().nextInt(myPrizeValues.length)];
      _winner = true;
      final player = AudioPlayer();
      player.setVolume(1);
      await player.play(AssetSource("sounds/high-score.mp3"));
      update();
    } else {
      if (soundController.getIsMute == true) {
        final player = AudioPlayer();
        player.setVolume(0);
        await player.play(AssetSource("sounds/spin.mp3"));
      } else {
        final player = AudioPlayer();
        player.setVolume(1);
        await player.play(AssetSource("sounds/spin.mp3"));
      }
    }
  }

  @override
  void onInit() async {
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    await shuffleItems();
    Future.delayed(Duration(milliseconds: 300));
    update();
    super.onInit();
  }
}
