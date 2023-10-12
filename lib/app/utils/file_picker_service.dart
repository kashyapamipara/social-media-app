import 'dart:io';

import 'package:social_media_app/app/Constants/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerService {
  FilePickerResult? result;

  Future<File?> singleFilePicker({List<String>? allowedExtensions}) async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
      type: FileType.custom,
    );

    if (result != null) {
      File file = File(result!.files.single.path!);
      return file;
    } else {
      print(
          '\x1B[32m<-------\x1B[0m \x1B[31m): File not picked :(\x1B[0m \x1B[32m------->\x1B[0m');
      return null;
    }
  }

  Future<List<File>?> multiFilePicker({List<String>? allowedExtensions}) async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: allowedExtensions,
      onFileLoading: (p0) {
        return p0 == FilePickerStatus.picking
            ? CircularProgressIndicator(
                color: AppColors.PRIMARY_COLOR,
              )
            : null;
      },
    );

    if (result != null) {
      List<File> files = result!.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return null;
    }
  }
}
