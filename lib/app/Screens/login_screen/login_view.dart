import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:social_media_app/app/Screens/login_screen/login_controller.dart';
import 'package:social_media_app/app/Screens/register_screen/register_controller.dart';
import 'package:social_media_app/app/Widget/button_widget.dart';
import 'package:social_media_app/app/Widget/header_view.dart';
import 'package:social_media_app/app/Widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.textScaleFactorOf(context));
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
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
              key: controller.loginKey,
              child: Container(
                margin: EdgeInsets.only(
                    top: 10.h, left: 5.w, right: 5.w, bottom: 10.h),
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
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.welComeBack,
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        AppStrings.enterInfo,
                        style: TextStyle(
                          color: AppColors.BLACK_COLOR,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),

                    ///Email
                    TextFieldWidget(
                      enableTitleText: true,
                      titleText: AppStrings.email,
                      controller: controller.emailController,
                      hintText: AppStrings.enterYourEmail,
                      hintColor: AppColors.HINT_GREY_COLOR,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                    SizedBox(height: 2.h),

                    ///Password
                    TextFieldWidget(
                      isSuffixIcon: true,
                      enableTitleText: true,
                      maxLines: 1,
                      titleText: AppStrings.password,
                      controller: controller.passwordController,
                      hintText: AppStrings.enterYourPassword,
                      hintColor: AppColors.HINT_GREY_COLOR,
                      obscureText: controller.obscureText.value,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                      visibilityOnPress: (() {
                        controller.obscureText(!controller.obscureText.value);
                      }),
                    ),
                    SizedBox(height: 2.h),
                    ButtonWidget(
                      buttonMargin: const EdgeInsets.only(left: 0, right: 0),
                      buttonText: AppStrings.login,
                      onPressed: () {
                        controller.checkLogin();
                      },
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.noAccount,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                              Get.put(() => RegisterController());
                            Get.offNamed(Routes.register);
                          },
                          child: Text(
                            AppStrings.register,
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
