import 'package:dotted_border/dotted_border.dart';
import 'package:mime/mime.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Screens/news_feed_screen/add_news_feed_screen/add_news_feed_controller.dart';

import 'package:social_media_app/app/Widget/button_widget.dart';
import 'package:social_media_app/app/Widget/header_view.dart';
import 'package:social_media_app/app/Widget/screen_loader_widget.dart';
import 'package:social_media_app/app/Widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/file_picker_service.dart';

class AddNewsFeedView extends GetView<AddNewsFeedController> {
  const AddNewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.BACKGROUND_COLOR,
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size(100.w, 11.5.h),
            child: HeaderView(
              homeHeader: true,
              showSuffix: false,
              headerTitle: AppStrings.addNewsFeed,
              headerTitleStyle: TextStyle(
                fontSize: 20.sp,
                color: AppColors.WHITE_COLOR,
                fontWeight: FontWeight.w500,
              ),
              prefixIconOnTap: () {
                Get.back();
              },
              prefixIconSize: 30,
            ),
          ),
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Save
              Container(
                height: 10.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.WHITE_COLOR,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.SHADOW_BUTTON_COLOR,
                        spreadRadius: 2,
                        blurRadius: 1)
                  ],
                ),
                child: ButtonWidget(
                  buttonText: AppStrings.save,
                  onPressed: () async {
                    await controller.addNewsFeedMedia();
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: RawScrollbar(
              thumbColor: AppColors.PRIMARY_COLOR,
              mainAxisMargin: 10.h,
              thickness: 1.2.w,
              interactive: true,
              trackRadius: const Radius.circular(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              thumbVisibility: true,
              trackVisibility: true,
              trackColor: AppColors.WHITE_COLOR,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.addNewsFeedFormKey,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
                    child: ScreenLoaderWidget(
                      showLoader: controller.isLoading.value,
                      child: Column(
                        children: [
                          ///whats happening ?
                          TextFieldWidget(
                            controller: controller.textController,
                            enableTitleText: true,
                            titleText: AppStrings.newsFeedText,
                            hintText: AppStrings.newsFeedText,
                            minLines: 3,
                            maxLines: 100,
                            keyboardType: TextInputType.multiline,
                            validator: (value) {
                              return controller.valudateNewsFeedText(value!);
                            },
                          ),
                          SizedBox(height: 2.h),

                          ///upload Image, Video or PDF
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.uploadImage,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.BLACK_COLOR,
                              ),
                            ),
                          ),
                          SizedBox(height: 0.6.h),
                          InkWell(
                            onTap: () async {
                              try {
                                controller.isFilePicking(true);
                                final selectedFile =
                                    await FilePickerService().singleFilePicker(
                                  allowedExtensions: [
                                    'jpeg',
                                    'jpg',
                                    'hevc',
                                    'png'
                                  ],
                                ).then((value) {
                                  return value;
                                });

                                if (selectedFile != null) {
                                  controller.pickedFile = selectedFile;
                                  controller.isFilePicked.value = true;
                                  await controller.newsFeedMediaApi();
                                } else {
                                  controller.pickedFile = null;
                                }
                              } finally {
                                controller.isFilePicking(false);
                              }
                            },
                            child: DottedBorder(
                              radius: const Radius.circular(12),
                              borderType: BorderType.RRect,
                              strokeWidth: 1.5,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 2),
                              dashPattern: const [10, 7],
                              color: AppColors.GREY_LIGHT_COLOR,
                              child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: AppColors.WHITE_COLOR,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.upload_rounded,
                                      color: AppColors.HINT_GREY_COLOR,
                                      size: 15.w,
                                    ),
                                    Text(
                                      AppStrings.attachFileHere,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.HINT_GREY_COLOR,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),

                          ///List of Files
                          controller.isFilePicking.value
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 2.h),
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.PRIMARY_COLOR),
                                  ),
                                )
                              : controller.pickedFile != null &&
                                      controller.isFilePicked.value
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 1.2.h),
                                      margin: EdgeInsets.only(bottom: 1.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.WHITE_COLOR,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.GREY_LIGHT_COLOR,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ///Icon & FileName
                                          Expanded(
                                            child: InkWell(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.image,
                                                    color: AppColors
                                                        .HINT_GREY_COLOR,
                                                    size: 6.w,
                                                  ),
                                                  SizedBox(width: 2.w),
                                                  Flexible(
                                                    child: Text(
                                                      controller
                                                              .pickedFile!.path
                                                              .split('/')
                                                              .last ??
                                                          'demo.png',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .BLACK_COLOR,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          ///delete
                                          InkWell(
                                            onTap: () {
                                              controller.pickedFile = null;
                                              controller.isFilePicked.value =
                                                  false;
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: AppColors.TOMATO,
                                              size: 6.w,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
