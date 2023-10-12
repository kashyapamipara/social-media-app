import 'package:cached_network_image/cached_network_image.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:social_media_app/app/Screens/follow_unfollow_screen/follow_unfollow_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FollowUnFollowView extends GetView<FollowUnFollowController> {
  const FollowUnFollowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                // decoration: BoxDecoration(
                //   color: AppColors.WHITE_COLOR,
                //   borderRadius: BorderRadius.circular(8),
                //   boxShadow: [
                //     BoxShadow(
                //         color: AppColors.SHADOW_LIGHT_COLOR,
                //         blurRadius: 1,
                //         spreadRadius: 2)
                //   ],
                // ),
                // width: 100.w,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //         children: [
                //           ///ProfileImage
                //           Container(
                //             padding: const EdgeInsets.all(3),
                //             decoration: BoxDecoration(
                //                 color: AppColors.WHITE_COLOR,
                //                 boxShadow: [
                //                   BoxShadow(
                //                       color: AppColors.SHADOW_LIGHT_COLOR,
                //                       spreadRadius: 3,
                //                       blurRadius: 2,
                //                       offset: Offset(0, -1)),
                //                   BoxShadow(
                //                       color: AppColors.WHITE_COLOR,
                //                       spreadRadius: 2,
                //                       blurRadius: 1,
                //                       offset: Offset(0, 2)),
                //                   BoxShadow(
                //                       color: AppColors.WHITE_COLOR,
                //                       spreadRadius: 2.5,
                //                       blurRadius: 1,
                //                       offset: Offset(-0.6, 0)),
                //                   BoxShadow(
                //                       color: AppColors.WHITE_COLOR,
                //                       spreadRadius: 2,
                //                       blurRadius: 1,
                //                       offset: Offset(-1, 1)),
                //                 ],
                //                 borderRadius: BorderRadius.circular(90)),
                //             child: CircleAvatar(
                //               radius: 6.w,
                //               backgroundColor: AppColors.PRIMARY_COLOR,
                //               child: Stack(
                //                 alignment: Alignment.center,
                //                 children: [
                //                   ClipOval(
                //                     child: SizedBox.fromSize(
                //                       size: Size.fromRadius(100.w),
                //                       child: profileImageURL != null
                //                           ? InkWell(
                                          
                //                               child: CachedNetworkImage(
                //                                 fit: BoxFit.fill,
                //                                 imageUrl: profileImageURL!,
                //                                 progressIndicatorBuilder:
                //                                     (context, url,
                //                                             downloadProgress) =>
                //                                         Padding(
                //                                   padding:
                //                                       const EdgeInsets.all(12),
                //                                   child:
                //                                       CircularProgressIndicator(
                //                                     value: downloadProgress
                //                                         .progress,
                //                                     color:
                //                                         AppColors.WHITE_COLOR,
                //                                   ),
                //                                 ),
                //                                 errorWidget:
                //                                     (context, url, error) =>
                //                                         Icon(
                //                                   Icons.error,
                //                                   color: AppColors
                //                                       .BACKGROUND_COLOR,
                //                                 ),
                //                               ),
                //                             )
                //                           : Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: [
                //                                 Text(
                //                                   getData(AppConstance
                //                                               .currentUserPersonName) !=
                //                                           null
                //                                       ? getData(AppConstance
                //                                                   .currentUserPersonName)[
                //                                               0]
                //                                           .toUpperCase()
                //                                       : String.fromCharCodes(
                //                                           Iterable.generate(
                //                                               1,
                //                                               (_) => AppConstance
                //                                                   .capitalAlphabates
                //                                                   .codeUnitAt(Random
                //                                                           .secure()
                //                                                       .nextInt(
                //                                                           26)))),
                //                                   style: TextStyle(
                //                                     color: AppColors
                //                                         .BACKGROUND_COLOR,
                //                                     fontWeight: FontWeight.w800,
                //                                     fontSize: 15.sp,
                //                                   ),
                //                                 ),
                //                                 Text(
                //                                   getData(AppConstance
                //                                                   .currentUserPersonName) !=
                //                                               null &&
                //                                           getData(AppConstance
                //                                                   .currentUserPersonName)
                //                                               .contains(' ') &&
                //                                           getData(AppConstance
                //                                                   .currentUserPersonName)
                //                                               .split(' ')[1]
                //                                               .isNotEmpty
                //                                       ? getData(AppConstance
                //                                               .currentUserPersonName)
                //                                           .split(' ')[1][0]
                //                                           .toUpperCase()
                //                                       : (getData(AppConstance
                //                                                   .currentUserPersonName) !=
                //                                               null
                //                                           ? ''
                //                                           : String
                //                                               .fromCharCodes(
                //                                               Iterable.generate(
                //                                                 1,
                //                                                 (_) => AppConstance
                //                                                     .capitalAlphabates
                //                                                     .codeUnitAt(Random
                //                                                             .secure()
                //                                                         .nextInt(
                //                                                             26)),
                //                                               ),
                //                                             )),
                //                                   style: TextStyle(
                //                                     color: AppColors
                //                                         .BACKGROUND_COLOR,
                //                                     fontWeight: FontWeight.w800,
                //                                     fontSize: 15.sp,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                     ),
                //                   ),
                //                   Align(
                //                     alignment: Alignment.bottomRight,
                //                     child: Container(
                //                       padding: EdgeInsets.all(0.5.w),
                //                       decoration: BoxDecoration(
                //                           color: AppColors.WHITE_COLOR,
                //                           boxShadow: [
                //                             BoxShadow(
                //                                 color:
                //                                     AppColors.GREY_LIGHT_COLOR,
                //                                 spreadRadius: 2,
                //                                 blurRadius: 1)
                //                           ],
                //                           borderRadius:
                //                               BorderRadius.circular(12)),
                //                       child: IconButton(
                //                         onPressed: () async {
                //                           final imageURL =
                //                               await ImagePickerService()
                //                                   .pickImage(
                //                                       source:
                //                                           ImageSource.gallery);
                //                           if (imageURL !=
                //                               AppStrings.imageNotSelected) {
                //                             await Get.put(
                //                                     PayRollEzyController())
                //                                 .editGlobalProfilePhotoApi(
                //                               image: imageURL!,
                //                             )
                //                                 .then(
                //                               (value) async {
                //                                 if (value.success == true) {
                //                                   setData(
                //                                       AppConstance
                //                                           .currentUserProfileUrl,
                //                                       value.data);
                //                                   setState(() {
                //                                     profileImageURL =
                //                                         value.data;
                //                                   });
                //                                 }
                //                               },
                //                             );
                //                           }
                //                         },
                //                         padding: EdgeInsets.zero,
                //                         iconSize: 12,
                //                         constraints: const BoxConstraints(),
                //                         icon: Icon(
                //                           Icons.edit,
                //                           size: 12,
                //                           color: AppColors.BLACK_COLOR,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               margin: EdgeInsets.only(left: 3.w),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     getData(AppConstance
                //                             .currentUserPersonName) ??
                //                         "Hello User",
                //                     style: TextStyle(fontSize: 12.sp),
                //                   ),
                //                   Text(
                //                     getData(AppConstance.currentUserEmailID) ??
                //                         "xyz@gmail.com",
                //                     style: TextStyle(
                //                         color: AppColors.HINT_GREY_COLOR,
                //                         fontSize: 11.sp),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     Row(
                //       children: [
                //         InkWell(
                //           onTap: () {
                //             Get.toNamed(Routes.forgot_password);
                //           },
                //           child: Container(
                //             padding: EdgeInsets.all(1.5.w),
                //             decoration: BoxDecoration(
                //                 color: AppColors.TOMATO,
                //                 borderRadius: BorderRadius.circular(8)),
                //             child: Icon(Icons.lock_reset,
                //                 color: AppColors.WHITE_COLOR, size: 3.h),
                //           ),
                //         ),
                //       ],
                //     )
                //   ],
                // ),
              );
    });
  }
}
