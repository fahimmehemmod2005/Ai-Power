import 'package:get/get.dart';

import '../controllers/terms_conditions_and_privacy_policy_controller.dart';

class TermsConditionsAndPrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsConditionsAndPrivacyPolicyController>(
      () => TermsConditionsAndPrivacyPolicyController(),
    );
  }
}
