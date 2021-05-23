import 'package:flutter/cupertino.dart';
import 'package:flutter_sales_management/app/services/services.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

class AppMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return Get.find<UserService>().logged
        ? null
        : RouteSettings(name: Routes.AUTHENTICATION);
  }
}
