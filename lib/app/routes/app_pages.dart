import 'package:flutter_sales_management/app/routes/app_middleware.dart';
import 'package:get/get.dart';
import '../ui/ui.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Routes.AUTHENTICATION,
        page: () => AuthenticationScreen(),
        binding: AuthenticationBinding()),
    GetPage(
        middlewares: [AppMiddleware()],
        name: Routes.DASHBOARD,
        page: () => DashBoardScreen(),
        binding: DashBoardBinding())
  ];
}
