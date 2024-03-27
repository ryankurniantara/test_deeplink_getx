import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_deep_link/app/routes/app_pages.dart';

class AppLinkService {
  AppLinkService._privateConstructor();

  static final AppLinkService _instance = AppLinkService._privateConstructor();

  static AppLinkService get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> initApplink() async {
    _appLinks = AppLinks();
    final url = await _appLinks.getInitialAppLink();
    if (url != null) {
      log('====>>>Initial url : $url');
      openAppLink(url);
    }

    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) {
        log('====>>> uriValue : $uriValue');
        openAppLink(uriValue);
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }

  void openAppLink(Uri url) async {
    log('====>>> uriValue : $url');
    if (url.pathSegments.first == 'firstPage') {
      log('====>>> product : ${url.pathSegments[0]}');

      Get.currentRoute != Routes.FIRST_PAGE
          ? Get.toNamed(Routes.FIRST_PAGE)
          : Get.back();
    } else if (url.pathSegments.first == 'secondPage') {
      log('====>>> profile : ${url.pathSegments[0]}');
      Get.currentRoute != Routes.SECOND_PAGE
          ? Get.toNamed(Routes.SECOND_PAGE)
          : Get.back();
    }
  }
}
