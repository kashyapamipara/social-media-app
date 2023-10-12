import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class TextFieldWidget extends StatelessWidget {
  Key? textFieldKey;
  bool? enableTitleText;
  String? titleText;
  Color? titleTextColor;
  Color? textFieldColor;
  double? textFieldHeight;
  String? hintText;
  Color? hintColor;
  int? maxLength;
  AutovalidateMode? autovalidateMode;
  bool? readOnly;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FormFieldValidator<String?>? validator;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String?>? onSaved;
  bool? obscureText;
  String? obscuringCharacter;
  TextAlign? textAlign;
  InputDecoration? decoration;
  EdgeInsets? contentPadding;
  TextStyle? hintTextStyle;
  double? textFieldWidth;
  Color? cursorColor;
  int errorMaxLines;

  ///Placed in textField (Note: suffixIcon** properties for inner suffix in textField)
  bool? isSuffixIcon;
  Widget? suffixIcon;
  VoidCallback? suffixIconOnTap;
  VoidCallback? visibilityOnPress;
  double? borderRadius;
  TextEditingController? controller = TextEditingController(text: '');
  bool? isPhoneField;
  Widget? phoneFieldChild;
  bool? isSuffixButton;
  VoidCallback? suffixButtonOnTap;
  double? suffixButtonHeight;
  double? suffixButtonWeight;

  ///Separate from textField (Note: All suffixButton** properties for separated suffix button)
  Widget? suffixButtonIcon;
  EdgeInsets? suffixButtonPadding;
  FocusNode? focusNode;
  String? errorText;
  BoxConstraints? prefixIconConstraints;
  BoxConstraints? suffixIconConstraints;
  Widget? prefixIcon;
  VoidCallback? prefixIconOnTap;
  int? maxLines;
  bool? showCounter;
  bool? isDense;
  int? minLines;
  bool isMultilineField;

  TextFieldWidget({
    Key? key,
    this.hintText,
    this.enableTitleText = false,
    this.titleText,
    this.titleTextColor,
    this.hintColor,
    this.controller,
    this.textFieldColor,
    this.textFieldHeight,
    this.maxLength,
    this.autovalidateMode,
    this.readOnly,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onTap,
    this.onSaved,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.obscuringCharacter,
    this.textAlign,
    this.decoration,
    this.contentPadding,
    this.hintTextStyle,
    this.isSuffixIcon = false,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.visibilityOnPress,
    this.cursorColor,
    this.borderRadius,
    this.textFieldWidth,
    this.isPhoneField = false,
    this.phoneFieldChild,
    this.isSuffixButton = false,
    this.suffixButtonOnTap,
    this.suffixButtonIcon,
    this.suffixButtonHeight,
    this.suffixButtonWeight,
    this.suffixButtonPadding,
    this.focusNode,
    this.errorText,
    this.prefixIconConstraints,
    this.prefixIcon,
    this.maxLines,
    this.prefixIconOnTap,
    this.showCounter = false,
    this.isDense,
    this.suffixIconConstraints,
    this.errorMaxLines = 2,
    this.minLines,
    this.isMultilineField = false,
    this.textFieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (enableTitleText!) ...[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  titleText ?? 'Title Text',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: titleTextColor ?? AppColors.BLACK_COLOR,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
            SizedBox(
              width: textFieldWidth ?? double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isPhoneField == true)
                    Container(
                      padding: contentPadding ??
                          const EdgeInsets.fromLTRB(10, 9.5, 8, 9.5),
                      decoration: BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        border: Border.all(
                            width: 1, color: AppColors.GREY_LIGHT_COLOR),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(borderRadius ?? 12),
                          topLeft: Radius.circular(borderRadius ?? 12),
                        ),
                      ),
                      child: phoneFieldChild,
                    ),
                  Expanded(
                    child: TextFormField(
                      key: textFieldKey,
                      controller: controller,
                      focusNode: focusNode,
                      autovalidateMode: autovalidateMode ??
                          AutovalidateMode.onUserInteraction,
                      readOnly: readOnly ?? false,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      cursorColor: cursorColor ?? AppColors.PRIMARY_COLOR,
                      validator: validator,
                      onChanged: onChanged,
                      onEditingComplete: onEditingComplete,
                      onFieldSubmitted: onFieldSubmitted,
                      onSaved: onSaved,
                      onTap: onTap,
                      maxLines: maxLines ?? 1,
                      minLines: minLines ?? 1,
                      obscureText: obscureText ?? false,
                      obscuringCharacter: obscuringCharacter ?? '•',
                      textAlign: textAlign ?? TextAlign.start,
                      maxLength: maxLength,
                      decoration: decoration ??
                          InputDecoration(
                            isDense: isDense,
                            errorMaxLines: errorMaxLines,
                            counterText: showCounter == true ? null : '',
                            suffixIcon: isSuffixIcon!
                                ? InkWell(
                                    onTap: suffixIconOnTap ??
                                        () {
                                          onTap?.call();
                                          visibilityOnPress?.call();
                                        },
                                    child: suffixIcon ??
                                        (obscureText!
                                            ? Icon(Icons.visibility_off,
                                                color:
                                                    AppColors.HINT_GREY_COLOR)
                                            : Icon(Icons.visibility,
                                                color:
                                                    AppColors.PRIMARY_COLOR)),
                                  )
                                : null,
                            fillColor: textFieldColor ?? AppColors.WHITE_COLOR,
                            filled: true,
                            suffixIconConstraints: suffixIconConstraints,
                            prefixIconConstraints: prefixIconConstraints,
                            prefixIcon: prefixIcon,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.GREY_LIGHT_COLOR),
                              borderRadius: isPhoneField == true
                                  ? BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(borderRadius ?? 12),
                                      topRight:
                                          Radius.circular(borderRadius ?? 12),
                                    )
                                  : BorderRadius.circular(borderRadius ?? 12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.GREY_LIGHT_COLOR),
                              borderRadius: isPhoneField == true
                                  ? BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(borderRadius ?? 12),
                                      topRight:
                                          Radius.circular(borderRadius ?? 12),
                                    )
                                  : BorderRadius.circular(borderRadius ?? 12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.RED_COLOR),
                              borderRadius: isPhoneField == true
                                  ? BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(borderRadius ?? 12),
                                      topRight:
                                          Radius.circular(borderRadius ?? 12),
                                    )
                                  : BorderRadius.circular(borderRadius ?? 12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.RED_COLOR),
                              borderRadius: isPhoneField == true
                                  ? BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(borderRadius ?? 12),
                                      topRight:
                                          Radius.circular(borderRadius ?? 12),
                                    )
                                  : BorderRadius.circular(borderRadius ?? 12),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            errorText: errorText,
                            hintText: hintText ?? '',
                            hintStyle: hintTextStyle ??
                                TextStyle(
                                  color: hintColor ?? AppColors.HINT_GREY_COLOR,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                            contentPadding: contentPadding ??
                                EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 1.2.h),
                          ),
                    ),
                  ),
                  if (isSuffixButton == true) ...[
                    SizedBox(width: 2.w),
                    SizedBox(
                      height: suffixButtonHeight ?? 46,
                      width: suffixButtonWeight ?? 46,
                      child: ElevatedButton(
                        onPressed: suffixButtonOnTap,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: suffixButtonPadding ?? EdgeInsets.zero,
                          backgroundColor: AppColors.PRIMARY_COLOR,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(borderRadius ?? 8),
                            side: const BorderSide(style: BorderStyle.none),
                          ),
                        ),
                        child: suffixButtonIcon ??
                            Icon(Icons.add, color: AppColors.WHITE_COLOR),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        if (isMultilineField)
          Positioned(
            bottom: 4.5,
            right: 4.5,
            child:
                SvgPicture.asset(Images.textboxDrag, height: 4.w, width: 4.w),
          ),
      ],
    );
  }
}
