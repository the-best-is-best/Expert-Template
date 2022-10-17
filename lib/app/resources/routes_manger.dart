import 'package:chat_ui/feature/get_start_1/presentation/view/get_start_1_view.dart';
import 'package:chat_ui/feature/get_start/view/get_start_view.dart';
import 'package:chat_ui/feature/home/presentation/view/home_view.dart';
import 'package:chat_ui/feature/splash/view/splash_view.dart';
import 'package:mit_x/mit_x.dart';

class Routes {
  static const non = "/";
  static const splashRoute = "/splash";
  static const getStartRoute = "/getStart";
  static const getStart1Route = "/getStart1";
  static const homeRoute = "/home";
}

class RouteManager {
  static List<MitXPage<dynamic>> get generateRoutes {
    return [
      MitXPage(name: Routes.splashRoute, page: () => const SplashView()),
      MitXPage(name: Routes.getStartRoute, page: () => const GetStartView()),
      MitXPage(name: Routes.getStart1Route, page: () => const GetStart1View()),
      MitXPage(
          name: Routes.homeRoute,
          page: () => const HomeView(),
          transitionDuration: const Duration(seconds: 1)),
    ];
  }
}
