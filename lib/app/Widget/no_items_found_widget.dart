import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Constants/images.dart';
import 'package:social_media_app/app/Widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class NoItemsFoundWidget extends StatelessWidget {
  var controller;

  NoItemsFoundWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.noResultFound, width: 55.w),
          const SizedBox(height: 10),
          Text(
            AppStrings.noResultsFound,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              textAlign: TextAlign.center,
              AppStrings.weCouldntFind,
              style: TextStyle(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.HINT_GREY_COLOR,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            onPressed: () {
              controller.pagingController.refresh();
            },
            buttonText: AppStrings.tryAgain
          ),
        ],
      ),
    );
  }
}
