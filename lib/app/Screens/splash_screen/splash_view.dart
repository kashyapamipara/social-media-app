import 'package:social_media_app/app/Screens/splash_screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Constants/color.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController _splashController = Get.find<SplashController>();
  var dataStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: Get.height,
        alignment: Alignment.center,
        width: Get.height,
        decoration: const BoxDecoration(color: Colors.green),
      ),
    );
  }
}
