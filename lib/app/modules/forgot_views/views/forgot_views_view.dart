import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_views_controller.dart';

class ForgotView extends GetView<ForgotViewsController> {
  const ForgotView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotViewsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotViewsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
