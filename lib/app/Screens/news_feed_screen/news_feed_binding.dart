import 'package:get/get.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/news_feed_controller.dart';

class NewsFeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewsFeedController());
  }
}
