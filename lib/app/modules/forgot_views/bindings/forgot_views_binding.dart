import 'package:get/get.dart';

import '../controllers/forgot_views_controller.dart';

class ForgotViewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotViewsController>(
      () => ForgotViewsController(),
    );
  }
}
