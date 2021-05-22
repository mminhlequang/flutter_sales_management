import 'package:get/get.dart';

import '../ui.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
  }
}