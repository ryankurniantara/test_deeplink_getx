import 'package:get/get.dart';

import '../controllers/second_page_controller.dart';

class SecondPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondPageController>(
      () => SecondPageController(),
    );
  }
}
