import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/app/Constants/color.dart';

import '../Widget/size_config.dart';

class AppStyles {
  static TextStyle get subHeadingTextStyle {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.PRIMARY_COLOR,
    );
  }

  static TextStyle get titleTextStyle {
    return TextStyle(
      fontSize: SizeConfig.textMultiplier! * 1.8,
      fontWeight: FontWeight.w500,
      color: AppColors.BLACK_COLOR,
    );
    //   GoogleFonts.roboto(
    //   textStyle: const TextStyle(
    //       fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
    // );
  }

  static TextStyle get bodyTextStyle {
    return TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.BLACK_COLOR);
    //   GoogleFonts.roboto(
    //   textStyle: const TextStyle(
    //       fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    // );
  }

  static TextStyle get scheduleDateSubTitle {
    return TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: AppColors.BLACK_COLOR);
  }

  static TextStyle get scheduleDateSubTitleGrey {
    return TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: AppColors.GREY_COLOR);
  }

  static TextStyle get scheduleDateTitle {
    return TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.BLACK_COLOR);
  }

  static TextStyle get scheduleDateTitleGrey {
    return TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.GREY_COLOR);
  }

  static TextStyle get impBodyTextStyle {
    return TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.BLACK_COLOR, fontFamily: "Inter");
    //   GoogleFonts.roboto(
    //   textStyle: const TextStyle(
    //       fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    // );
  }

  static TextStyle get captionTextStyle {
    return TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Inter", color: AppColors.EXTREAME_LITE_PURPLE_COLOR);
    //   GoogleFonts.roboto(
    //   textStyle: TextStyle(
    //       fontSize: 12,
    //       fontWeight: FontWeight.w400,
    //       color: Colors.black.withOpacity(0.85)),
    // );
  }

  static TextStyle get overlineTextStyle {
    return TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey[600], fontFamily: "Inter");
    //   GoogleFonts.roboto(
    //   textStyle: TextStyle(
    //       fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey[600]),
    // );
  }

  static TextStyle get buttonTextStyle {
    return TextStyle(
      color: AppColors.SECONDARY_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get medBlackBoldTextStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get medWhiteBoldTextStyle {
    return TextStyle(
      color: AppColors.WHITE_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get buttonWhiteTextStyle {
    return TextStyle(
      color: AppColors.WHITE_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get buttonGreyMidTextStyle {
    return TextStyle(
      color: AppColors.GREY_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get smallBoldTextStyle {
    return TextStyle(
        color: AppColors.BLACK_COLOR, fontSize: 6.sp, fontWeight: FontWeight.w700, fontFamily: "ReemKufi");
  }

  static TextStyle get workTextBoldStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 11.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get hintTextStyle {
    return TextStyle(
      color: AppColors.HINT_GREY_COLOR,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get workTextStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get workTextSmallStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static BorderSide get buttonBorderSide {
    return BorderSide(
      color: AppColors.SECONDARY_COLOR,
      width: 2,
      style: BorderStyle.solid,
    );
  }

  static TextStyle get locationItemTextStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get formHeaderTextStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get formTextStyle {
    return TextStyle(
        color: AppColors.BLACK_COLOR, fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: "ReemKufi");
  }

  static TextStyle get formTextGreyStyle {
    return TextStyle(
      color: AppColors.GREY_COLOR,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get locationItemText2Style {
    return TextStyle(color: AppColors.MID_GREY_COLOR, fontSize: 10.sp, fontWeight: FontWeight.w700);
  }

  static TextStyle get locationItemText3Style {
    return TextStyle(color: AppColors.MID_GREY_COLOR, fontSize: 11.sp, fontWeight: FontWeight.w500);
  }

  static TextStyle get locationItemText2StyleBlack {
    return TextStyle(color: AppColors.BLACK_COLOR, fontSize: 10.sp, fontWeight: FontWeight.w700);
  }
}
