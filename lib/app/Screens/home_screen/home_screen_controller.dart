import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/app/Constants/app_constance.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';

import '../../Routes/app_pages.dart';

class HomeScreenController extends GetxController {
  RxString headerValue = 'Home screen'.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    clearData();
    Get.offAndToNamed(Routes.login);
  }
}
