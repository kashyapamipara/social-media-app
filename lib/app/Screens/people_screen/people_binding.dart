import 'package:get/get.dart';
import 'package:social_media_app/app/Screens/people_screen/people_controller.dart';

class PeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PeopleController());
  }
}
