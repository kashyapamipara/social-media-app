import 'package:social_media_app/app/Constants/app_constance.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/news_feed_controller.dart';
import 'package:social_media_app/app/Widget/post_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/header_view.dart';

class NewsFeedView extends GetView<NewsFeedController> {
  const NewsFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(100.w, 10.h),
          child: HeaderView(
            homeHeader: true,
            headerTitle: AppStrings.newsFeed,
            showSuffix: false,
          ),
        ),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Column(
          children: [
            ///add Feed, filter and search
            Container(
              padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
              color: AppColors.BACKGROUND_COLOR,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.addNewsFeed);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: AppColors.PRIMARY_COLOR,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(Icons.add,
                                      color: AppColors.WHITE_COLOR,
                                      size: 3.2.h),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),

            controller.isLoading.value
                ? CircularProgressIndicator(color: AppColors.PRIMARY_COLOR,)
                : ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PostTileWidget(
                        postMediaURLs:
                            controller.newsFeed.value[index].imageUrl!,
                        personId: getData(AppConstance.currentUserPersonID),
                        personName: controller.users.value[index].userName,
                        postCaption: controller.newsFeed.value[index].text!,
                        isMediaAvailable:
                            controller.newsFeed.value[index].imageUrl != 'null'
                                ? true
                                : false,
                      );
                    },
                    itemCount: controller.newsFeed.value.length,
                  )
          ],
        ),
      );
    });
  }
}
