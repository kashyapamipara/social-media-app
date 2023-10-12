import 'dart:io';

import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Widget/loding_view.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerService {
  Future<String?> pickImage(
      {required ImageSource source, bool isShowLoader = true}) async {
    if (source == ImageSource.camera) {
      if (await Permission.camera.isGranted) {
        if (kDebugMode) {
          print("Camera Permission ::::: Granted");
        }
      } else if (await Permission.camera.isPermanentlyDenied) {
        if (kDebugMode) {
          print("Camera Permission ::::: PermanentlyDenied");
        }
        await openAppSettings();
      } else if (await Permission.camera.isDenied) {
        if (kDebugMode) {
          print("Camera Permission ::::: Denied");
        }
        await Permission.camera.request();
      }
    }

    if (source == ImageSource.gallery) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted) {
      } else if (await Permission.storage.request().isPermanentlyDenied ||
          await Permission.photos.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.storage.request().isDenied ||
          await Permission.photos.request().isDenied) {}
    }

    XFile? pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 100);

    if (kDebugMode) {
      print("image ::: $pickedFile");
    }

    if (pickedFile == null) {
      if (kDebugMode) {
        print(AppStrings.imageNotSelected);
      }
      return AppStrings.imageNotSelected;
    } else {
      File file = File(pickedFile.path);

      if (kDebugMode) {
        print("filePath ::: ${file.path}");
      }

      if (isShowLoader) {
        //showDialogs(Popups(statement: "Loading"));

        // show progress dialog
        Get.dialog(LoadingProgressBar(isDisMissile: false),
            barrierDismissible: false);
      }

      if (isShowLoader) {
        // dismiss progress dialog
        Get.back();
      }

      return file.path;
    }
  }
}
