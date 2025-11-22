import 'package:get/get.dart';
import '../controllers/otp_controller.dart';
import '../controllers/pinput_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<PinInputController>(() => PinInputController());
  }
}
