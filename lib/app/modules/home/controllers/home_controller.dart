import 'package:get/get.dart';
import 'package:test_deep_link/app/data/applink_service.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final AppLinkService _appLinksDeepLink = AppLinkService.instance;

  @override
  void onInit() {
    super.onInit();

    _appLinksDeepLink.initApplink();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
