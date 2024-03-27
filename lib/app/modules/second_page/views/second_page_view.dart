import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/second_page_controller.dart';

class SecondPageView extends GetView<SecondPageController> {
  const SecondPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SecondPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
