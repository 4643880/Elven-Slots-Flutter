import 'package:eleven_slots/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> init() async {
  // Controllers
  Get.put(GameController());
  // Get Storage
  await GetStorage.init();
}
