


import 'package:social_media_app/app/Screens/register_screen/register_controller.dart';
import 'package:get/get.dart';

class FollowUnFollowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
