import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinInputController extends GetxController {
  final TextEditingController pinController = TextEditingController();
  final RxString pin = ''.obs;
  final RxBool isPinComplete = false.obs;

  // Define the correct PIN
  final String correctPin = '1234';

  @override
  void onInit() {
    super.onInit();
    pinController.addListener(_onPinChanged);
  }

  void _onPinChanged() {
    pin.value = pinController.text;
    isPinComplete.value = _validatePinLength();
  }

  void onPinCompleted(String completedPin) {
    pin.value = completedPin;
    isPinComplete.value = true;
    print('PIN Completed: $completedPin');
  }

  void onPinChanged(String value) {
    pin.value = value;
    isPinComplete.value = _validatePinLength();
  }

  bool _validatePinLength() {
    // Check if PIN is exactly 4 digits and contains only numbers
    return pin.value.length == 4 && RegExp(r'^\d{4}$').hasMatch(pin.value);
  }

  void clearPin() {
    pinController.clear();
    pin.value = '';
    isPinComplete.value = false;
  }

  String getPin() {
    return pin.value;
  }

  bool validatePin() {
    return _validatePinLength();
  }

  bool verifyPin() {
    // Check if the entered PIN matches the correct PIN
    return pin.value == correctPin;
  }

  void submitPin() {
    if (!validatePin()) {
      Get.snackbar(
        'Error',
        'Please enter a valid 4-digit PIN',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    // Verify if PIN is correct
    if (verifyPin()) {
      Get.snackbar(
        'Success',
        'PIN verified successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );

      // Add your navigation or next step logic here
      // Example: Get.offAllNamed('/home');
      // Or call an API to verify the OTP
    } else {
      Get.snackbar(
        'Error',
        'Incorrect PIN. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );

      // Optionally clear the PIN after wrong attempt
      clearPin();
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}