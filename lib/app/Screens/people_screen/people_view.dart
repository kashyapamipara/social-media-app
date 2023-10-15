import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Screens/people_screen/people_controller.dart';
import 'package:social_media_app/app/Widget/button_widget.dart';
import 'package:social_media_app/app/Widget/header_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/style.dart';

class PeopleView extends GetView<PeopleController> {
  const PeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: PreferredSize(
          preferredSize: Size(100.w, 11.5.h),
          child: HeaderView(
              homeHeader: true,
            headerTitle: AppStrings.people,
            showSuffix: false,
          ),
        ),
        body: controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.PRIMARY_COLOR,
              ))
            : Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        buttonText: AppStrings.follower,
                        onPressed: () {
                          controller.selectedValue.value = true;
                          print(
                              "object false ${controller.selectedValue.isTrue}");
                        },
                        buttonHeight: 5.3.h,
                        buttonMargin: EdgeInsets.zero,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8),
                        ),
                        buttonBorderSide: AppStyles.buttonBorderSide,
                        buttonTextStyle: controller.selectedValue.value
                            ? AppStyles.buttonWhiteTextStyle
                            : AppStyles.buttonTextStyle,
                        buttonColor: controller.selectedValue.value
                            ? AppColors.SECONDARY_COLOR
                            : AppColors.WHITE_COLOR,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: ButtonWidget(
                        buttonText: AppStrings.others,
                        onPressed: () {
                          controller.selectedValue.value = false;
                          print(
                              "object false ${controller.selectedValue.isTrue}");
                        },
                        buttonHeight: 5.3.h,
                        buttonMargin: EdgeInsets.zero,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8),
                        ),
                        buttonBorderSide: AppStyles.buttonBorderSide,
                        buttonTextStyle: !controller.selectedValue.value
                            ? AppStyles.buttonWhiteTextStyle
                            : AppStyles.buttonTextStyle,
                        buttonColor: !controller.selectedValue.value
                            ? AppColors.SECONDARY_COLOR
                            : AppColors.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
             controller.selectedValue.value? Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.5.h, horizontal: 4.w),
                    child: Container(
                    
                      decoration: BoxDecoration(
                        color: AppColors.LITE_GREY_COLOR,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.w),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                             controller.followers.value[index].imageUrl ?? '',
                            ),
                            radius: 20,
                          ),
                           SizedBox(width:3.w),
                                        Text(
                                          controller.followers.value[index].user_name ?? 'John Doe',
                                          style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                                          ),
                                        ),
                        ]),
                      ),
                    ),
                  );
                },
                itemCount: controller.followers.value.length,),
              ):

                   Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.5.h, horizontal: 4.w),
                    child: Container(
                    
                      decoration: BoxDecoration(
                        color: AppColors.LITE_GREY_COLOR,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.w),
                        child: Row(children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                             controller.unFollowers.value[index].imageUrl ?? '',
                            ),
                            radius: 20,
                          ),
                           SizedBox(width:3.w),
                                        Text(
                                          controller.unFollowers.value[index].user_name ?? 'John Doe',
                                          style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                                          ),
                                        ),
                        ]),
                      ),
                    ),
                  );
                },
                itemCount: controller.unFollowers.value.length,),
              ),
            ],
              ),
      );
    });
  }
}
