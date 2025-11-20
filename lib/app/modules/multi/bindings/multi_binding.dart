import 'package:get/get.dart';

import '../controllers/multi_controller.dart';

class MultiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultiController>(
      () => MultiController(),
    );
  }
}
