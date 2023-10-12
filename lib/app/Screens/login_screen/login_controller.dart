import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_constance.dart';
import '../../Constants/app_strings.dart';
import '../../Constants/app_utils.dart';
import '../../Constants/get_storage.dart';
import '../../Routes/app_pages.dart';

class LoginController extends GetxController {
  var doAnimate = false.obs;
  RxBool obscureText = true.obs;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<bool> switchValue = false.obs;

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        doAnimate(true);
      },
    );
    super.onInit();
  }

  /// user login api
  void loginApi() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      setData(AppConstance.currentUserPersonID, userCredential.user!.uid);
      Get.offAllNamed(Routes.homeScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.validationCheck(
            title: "Error", message: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils.validationCheck(
            title: "Error", message: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }

  /// validate email
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterEmailAddress;
    }
    return null;
  }

  /// validate password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterPassword;
    }
    return null;
  }

  /// check login
  Future<void> checkLogin() async {
    final isValid = loginKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      loginApi();
    }
  }
}
