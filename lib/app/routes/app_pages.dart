import 'package:get/get.dart';
import '../ui/ui.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashBoardScreen(),
      binding: DashBoardBinding()
    )
  ];
}
