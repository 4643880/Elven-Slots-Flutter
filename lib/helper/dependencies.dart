import 'package:eleven_slots/controllers/bet_controller.dart';
import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:eleven_slots/controllers/sound_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> init() async {
  // Controllers
  Get.put(SoundController());
  Get.put(BetController());
  Get.put(GameController());
}
