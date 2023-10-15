import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Screens/home_screen/home_screen_controller.dart';
import '../../Constants/color.dart';
import '../../Routes/app_pages.dart';
import '../../Widget/header_view.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: PreferredSize(
          preferredSize: Size(100.w, 10.h),
          child: HeaderView(
            homeHeader: true,
            headerTitle: controller.headerValue.value,
            showSuffix: false,
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.newsFeed);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.h, left: 4.w, right: 4.w),
              child: Container(
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.PRIMARY_COLOR),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.switch_access_shortcut_add_outlined,
                      color: AppColors.WHITE_COLOR,
                      size: 30.sp,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      'News Feed',
                      style: TextStyle(
                          color: AppColors.WHITE_COLOR, fontSize: 20.sp),
                    )
                  ],
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.peopleScreen);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.h, left: 4.w, right: 4.w),
              child: Container(
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.PRIMARY_COLOR),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.group,
                      color: AppColors.WHITE_COLOR,
                      size: 30.sp,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      'People',
                      style: TextStyle(
                          color: AppColors.WHITE_COLOR, fontSize: 20.sp),
                    )
                  ],
                )),
              ),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.PRIMARY_COLOR,
            onPressed: () async {
              await controller.logOut();
            },
            child: Icon(Icons.logout)),
      );
    });
  }
}
