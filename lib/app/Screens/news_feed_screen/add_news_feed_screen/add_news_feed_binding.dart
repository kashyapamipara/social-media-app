import 'package:get/get.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/add_news_feed_screen/add_news_feed_controller.dart';

class AddNewsFeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewsFeedController());
  }
}
