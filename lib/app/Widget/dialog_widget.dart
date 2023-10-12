import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constants/color.dart';

class DialogWidget extends StatelessWidget {
  String? image;
  String? title;
  String? subtitleText;
  Widget? extraDetails;
  VoidCallback? onTap;
  bool enableSubtitle;
  bool enableExtraDetails;

  DialogWidget({
    Key? key,
    this.image,
    this.onTap,
    this.title,
    this.enableSubtitle = false,
    this.subtitleText,
    this.extraDetails,
    this.enableExtraDetails = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w),
      child: AlertDialog(
        backgroundColor: AppColors.WHITE_COLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titlePadding: EdgeInsets.only(left: 9.w, right: 9.w, top: 4.h, bottom: 2.h),
        title: InkWell(
          onTap: () {
            onTap!.call();
          },
          child: Column(
            children: [
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 1.5.h),
              if (enableSubtitle)
                Text(
                  subtitleText!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.HINT_GREY_COLOR,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              SizedBox(height: 2.h),
              if (enableExtraDetails) extraDetails!,
            ],
          ),
        ),
        insetPadding: EdgeInsets.zero,
      ),
    );
  }
}
