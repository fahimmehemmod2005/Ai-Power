import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinInputController extends GetxController {
  final TextEditingController pinController = TextEditingController();
  final RxString pin = ''.obs;
  final RxBool isPinComplete = false.obs;

  final String correctPin = '1234';

  @override
  void onInit() {
    super.onInit();
    pinController.addListener(_handlePinChange);
  }

  void _handlePinChange() {
    pin.value = pinController.text;
    isPinComplete.value = pin.value.length == 4;
  }

  // 👇 PUBLIC method for CustomPinInput.onChanged
  void onPinChanged(String value) {
    pinController.text = value;
    pinController.selection = TextSelection.collapsed(offset: value.length);
    _handlePinChange();
  }

  // 👇 PUBLIC method for CustomPinInput.onCompleted
  void onPinCompleted(String value) {
    onPinChanged(value);
  }

  void clearPin() {
    pinController.clear();
    pin.value = '';
    isPinComplete.value = false;
  }

  bool validatePin() => pin.value.length == 4;

  bool verifyPin() => pin.value == correctPin;

  bool submitPin() {
    if (!validatePin()) {
      Get.snackbar('Error', 'Please enter a valid 4-digit PIN');
      return false;
    }

    if (verifyPin()) {
      Get.snackbar('Success', 'PIN verified successfully');
      return true;
    } else {
      Get.snackbar('Error', 'Incorrect PIN. Please try again.');
      clearPin();
      return false;
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
