import 'package:aipower/app/modules/signup/controllers/checkbox_controller.dart';
import 'package:aipower/app/modules/signup/controllers/hiddenpass_controller.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController()
    );
    Get.lazyPut<PassController>(
        () => PassController()
    );
    Get.lazyPut<CheckboxController>(
        () => CheckboxController()
    );
  }
}
