import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConnectivityWidget extends StatefulWidget {
  Widget child;

  ConnectivityWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: connectivityController.noInternet.value
            ? Stack(
                children: [
                  widget.child,
                  Container(
                    height: Get.height,
                    width: Get.width,
                    color: AppColors.TRANSPARENT,
                    child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: AppColors.LITE_GREEN_COLOR,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              Images.noInternet,
                              alignment: Alignment.center,
                              height: Get.height / 3,
                            ),
                            const Text('No Internet'),
                          ],
                        ),
                        elevation: 50),
                  ),
                ],
              )
            : widget.child,
      );
    });
  }
}

class ConnectivityController extends GetxController {
  RxBool noInternet = false.obs;
}
