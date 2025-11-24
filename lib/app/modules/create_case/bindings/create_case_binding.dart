import 'package:get/get.dart';

import '../controllers/create_case_controller.dart';

class CreateCaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCaseController>(
      () => CreateCaseController(),
    );
  }
}
