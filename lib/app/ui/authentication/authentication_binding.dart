import 'package:get/get.dart';
import '../ui.dart';

class AuthenticationBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController());
  }
}
