import 'package:get/get.dart';

import '../controllers/backtologin_controller.dart';

class BacktologinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BacktologinController>(
      () => BacktologinController(),
    );
  }
}
