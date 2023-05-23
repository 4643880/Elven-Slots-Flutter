import 'package:eleven_slots/screens/main_screen.dart';
import 'package:eleven_slots/screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const initial = "/";
  static const routeSplash = "/routeSplash";
  static const routeMainScreen = "/routeMainScreen";

  static List<GetPage> routes = [
    GetPage(
      name: RouteHelper.routeSplash,
      // page: () => ResponsiveView(),
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteHelper.routeMainScreen,
      // page: () => ResponsiveView(),
      page: () => const MainScreen(),
    ),
  ];
}
