import 'package:social_media_app/app/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonWidget extends StatelessWidget {
  String? buttonText;
  VoidCallback onPressed;
  EdgeInsets? buttonMargin;
  EdgeInsets? buttonPadding;
  BorderRadius? borderRadius;
  Color? buttonColor;
  TextStyle? buttonTextStyle;
  double? buttonWidth;
  double? buttonHeight;
  ButtonStyle? elevatedButtonStyle;
  Widget? child;
  BorderSide? buttonBorderSide;
  double? buttonElevation;
  TextOverflow? textOverflow;

  ButtonWidget({
    Key? key,
    this.buttonText,
    required this.onPressed,
    this.buttonTextStyle,
    this.buttonMargin,
    this.buttonPadding,
    this.borderRadius,
    this.buttonColor,
    this.buttonHeight,
    this.buttonWidth,
    this.elevatedButtonStyle,
    this.child,
    this.buttonBorderSide,
    this.buttonElevation,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      margin: buttonMargin ?? EdgeInsets.only(left: 5.w, right: 5.w),
      height: buttonHeight ?? 6.h,
      width: buttonWidth ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButtonStyle ??
            ElevatedButton.styleFrom(
              elevation: buttonElevation ?? 0,
              padding: buttonPadding ?? EdgeInsets.zero,
              backgroundColor: buttonColor ?? AppColors.PRIMARY_COLOR,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                side: buttonBorderSide ??
                    const BorderSide(style: BorderStyle.none),
              ),
            ),
        child: child ??
            Text(
              buttonText ?? 'Button',
              overflow: textOverflow,
              style: buttonTextStyle ??
                  TextStyle(
                    color: AppColors.WHITE_COLOR,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
            ),
      ),
    );
  }
}
