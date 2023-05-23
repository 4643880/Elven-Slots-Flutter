import 'package:get/get.dart';

class SoundController extends GetxController {
  bool _isMute = false;

  bool get getIsMute => _isMute;

  bool setIsMute(bool value) {
    if (value == true) {
      _isMute = true;
      update();
      return true;
    } else {
      _isMute = false;
      update();
      return false;
    }
  }
}
