import 'package:social_media_app/app/Screens/follow_unfollow_screen/follow_unfollow_screen_binding.dart';
import 'package:social_media_app/app/Screens/follow_unfollow_screen/follow_unfollow_screen_view.dart';
import 'package:social_media_app/app/Screens/home_screen/home_screen_view.dart';
import 'package:social_media_app/app/Screens/login_screen/login_binding.dart';
import 'package:social_media_app/app/Screens/login_screen/login_view.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/add_news_feed_screen/add_news_feed_binding.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/add_news_feed_screen/add_news_feed_view.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/news_feed_binding.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/news_feed_view.dart';
import 'package:social_media_app/app/Screens/register_screen/register_view.dart';
import 'package:social_media_app/app/Screens/splash_screen/splash_binding.dart';
import 'package:social_media_app/app/Screens/splash_screen/splash_view.dart';
import 'package:get/get.dart';

import '../Screens/home_screen/home_screen_binding.dart';
import '../Screens/register_screen/register_binding.dart';

part 'app_routes.dart';

Duration transitionDuration = const Duration(milliseconds: 500);

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.downToUp,
      // customTransition: CustomAnimationTransition(),
      transitionDuration: const Duration(milliseconds: 2000),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      transition: Transition.fadeIn,
      binding: RegisterBinding(),
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: Routes.addNewsFeed,
      page: () => const AddNewsFeedView(),
      binding: AddNewsFeedBinding(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
     GetPage(
      name: Routes.newsFeed,
      page: () => const NewsFeedView(),
      binding: NewsFeedBinding(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
        GetPage(
      name: Routes.followUnfollowScreen,
      page: () => const FollowUnFollowView(),
      binding: FollowUnFollowBinding(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
