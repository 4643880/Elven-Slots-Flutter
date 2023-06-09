import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:eleven_slots/controllers/sound_controller.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  SoundController soundController = Get.find();

  bool _inProgressSingleIteration = false;
  bool get getProgressLoopSingleIteration => _inProgressSingleIteration;
  setProgressSingleIteration(bool value) {
    _inProgressSingleIteration = value;
    update();
  }

  bool _inProgressLoop = false;
  bool get getProgressLoop => _inProgressLoop;
  setProgressLoop(bool value) {
    _inProgressLoop = value;
    update();
  }

  bool _temp = false;
  bool get getTemp => _temp;
  setTemp(bool value) {
    _temp = value;
    update();
  }

  bool _autoStart = false;
  bool get getAutoStart => _autoStart;
  setAutoStart(bool value) {
    _autoStart = value;
    update();
  }

  bool _switchButton = false;
  bool get getSwitchButton => _switchButton;
  setSwitchButton(bool value) {
    _switchButton = value;
    update();
  }

  bool _youWinScreenValue = false;
  bool get getYouWinScreenValue => _youWinScreenValue;
  setYouWinScreenValue(bool value) {
    _youWinScreenValue = value;
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
  void setPrizeValue(int value) {
    _prizeValue = value;
  }

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

  Future<void> shuffleItemsTemporary() async {
    items.shuffle();
    _item1 = items[0];
    _item2 = items[1];
    _item3 = items[2];
    _item4 = items[3];
    _item5 = items[4];
    _item6 = items[5];
    _item7 = items[6];
    _item8 = items[7];
    _item9 = items[8];
    update();
  }

  Future<bool> checkWin() async {
    if ((_item1 == _item2 && _item2 == _item3) ||
        (_item4 == _item5 && _item5 == _item6) ||
        (_item7 == _item8 && _item8 == _item9)) {
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
      _prizeValue = 0;
      _prizeValue =
          _prizeValue + myPrizeValues[Random().nextInt(myPrizeValues.length)];
      _winner = true;
      final player = AudioPlayer();
      player.setVolume(1);
      await player.play(AssetSource("sounds/high-score.mp3"));
      await Future.delayed(const Duration(seconds: 3));
      _youWinScreenValue = true;
      _autoStart = false;
      update();
      return true;
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
      return false;
    }
  }

  @override
  void onInit() async {
    await shuffleItems();
    Future.delayed(const Duration(milliseconds: 300));
    update();
    super.onInit();
  }
}
