import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:social_media_app/app/Screens/register_screen/register_controller.dart';
import 'package:social_media_app/app/Widget/button_widget.dart';
import 'package:social_media_app/app/Widget/header_view.dart';
import 'package:social_media_app/app/Widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.BACKGROUND_COLOR,
          appBar: PreferredSize(
            preferredSize: Size(100.w, 11.5.h),
            child: HeaderView(),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.signUpKey,
              child: Container(
                margin: EdgeInsets.only(
                    top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.BOTTOM_APP_WHITE_COLOR,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.SHADOW_LIGHT_COLOR,
                        spreadRadius: 3,
                        blurRadius: 2)
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.createAnAccount,
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                
                    SizedBox(height: 4.h),
                    TextFieldWidget(
                      enableTitleText: true,
                      titleText: AppStrings.userName,
                      controller: controller.nameController,
                      hintText: AppStrings.enterYourUserName,
                      hintColor: AppColors.HINT_GREY_COLOR,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return controller.validateUserName(value!);
                      },
                      maxLength: 50,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 2.h),
                    TextFieldWidget(
                      textFieldKey: controller.emailFieldKey,
                      focusNode: controller.emailFocusNode,
                      autovalidateMode: AutovalidateMode.disabled,
                      enableTitleText: true,
                      titleText: AppStrings.email,
                      controller: controller.emailController,
                      hintText: AppStrings.enterYourEmailAddress,
                      hintColor: AppColors.HINT_GREY_COLOR,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      textInputAction: TextInputAction.done,
                      maxLength: 100,
                    ),
                    SizedBox(height: 2.h),
                     ///password
                        TextFieldWidget(
                          controller: controller.passwordController,
                          enableTitleText: true,
                          titleText: AppStrings.password,
                          hintText: AppStrings.hintPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isSuffixIcon: true,
                          obscureText: controller.isObscurePassword.value,
                          visibilityOnPress: () {
                            controller.isObscurePassword(!controller.isObscurePassword.value);
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          maxLength: 30,
                        ),
                        SizedBox(height: 2.h),

                        ///confirmPassword
                        TextFieldWidget(
                          controller: controller.confirmPasswordController,
                          enableTitleText: true,
                          titleText: AppStrings.confirmPassword,
                          hintText: AppStrings.hintPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isSuffixIcon: true,
                          obscureText: controller.isObscureConfirmPassword.value,
                          visibilityOnPress: () {
                            controller.isObscureConfirmPassword(!controller.isObscureConfirmPassword.value);
                          },
                          validator: (value) {
                            return controller.validateConfirmPassword(value!, controller.passwordController.text);
                          },
                          maxLength: 30,
                        ),
                        SizedBox(height: 2.h,),
                    ButtonWidget(
                      buttonMargin: const EdgeInsets.only(left: 0, right: 0),
                      buttonText: AppStrings.register,
                      onPressed: () {
                        controller.checkSignUp();
                      },
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.haveAccount,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.login);
                          },
                          child: Text(
                            AppStrings.login,
                            style: TextStyle(
                              color: AppColors.SECONDARY_COLOR,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
