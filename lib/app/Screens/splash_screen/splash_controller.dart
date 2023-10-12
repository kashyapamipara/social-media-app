import 'dart:async';

import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Constants/app_constance.dart';

class SplashController extends GetxController {
  var change = true.obs;
  var changeIs = 0.obs;
  var context;

  @override
  Future<void> onInit() async {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        getData(AppConstance.currentUserPersonID) != null
            ? Get.offNamed(Routes.homeScreen)
            : Get.offNamed(Routes.login);
      },
    );

    WidgetsFlutterBinding.ensureInitialized();
  }
}
