import 'package:get/get.dart';
import 'package:social_media_app/app/Screens/register_screen/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
