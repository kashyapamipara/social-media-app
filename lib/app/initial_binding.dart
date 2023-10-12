
import 'package:get/get.dart';
import 'package:social_media_app/app/Screens/login_screen/login_controller.dart';
import 'package:social_media_app/app/Screens/register_screen/register_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialBinding());
        Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
