import 'package:get/get.dart';

import '../../signup/controllers/checkbox_controller.dart';
import '../../signup/controllers/hiddenpass_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<PassController>(
            () => PassController()
    );
    Get.lazyPut<CheckboxController>(
            () => CheckboxController()
    );
  }
}
