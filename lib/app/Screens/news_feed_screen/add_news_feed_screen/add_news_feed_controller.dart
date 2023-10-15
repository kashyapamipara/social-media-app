import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:objectid/objectid.dart';
import 'package:social_media_app/app/Constants/app_constance.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Network/services/graphql_services/graphql_queries.dart';

import '../../../Constants/graphql_constant.dart';
import '../../../Routes/app_pages.dart';

class AddNewsFeedController extends GetxController {
  RxBool isRequireConfirmation = true.obs;
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> addNewsFeedFormKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  RxString fileUrl = 'null'.obs;

  File? pickedFile;
  RxBool isFilePicked = false.obs;
  RxBool isFilePicking = false.obs;
  List<Map<String, String>> storagePathUrlList = [];

  @override
  void onInit() async {
    super.onInit();
  }

  String? valudateNewsFeedText(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return AppStrings.pleaseEnterNewsFeedText;
    }
    return null;
  }

  Future newsFeedMediaApi() async {
    // ignore: unnecessary_null_comparison
    if (pickedFile == null || pickedFile!.path == null) {
      Utils.validationCheck(title: "Error", message: 'Please select file.');
    }
    final firebaseStorage = FirebaseStorage.instance;
    var file = File(pickedFile!.path);
    if (pickedFile != null) {
      //Upload to Firebase
      var snapshot = await firebaseStorage
          .ref()
          .child('images/${DateTime.now()}')
          .putFile(file);
      fileUrl.value = await snapshot.ref.getDownloadURL();
    } else {
      print('No Image Path Received');
    }
  }

  Future addNewsFeedMedia() async {
    final isValid = addNewsFeedFormKey.currentState!.validate();

    if (!isValid) {
      return;
    } else if (storagePathUrlList.length > 1) {
      Utils.validationCheck(
          title: 'Error', message: 'You can\'t upload more than one media.');
      return;
    } else {
      print('**********${textController.text}');
      final MutationOptions options = MutationOptions(
        document: gql(addNewsFeed),
        variables: {
          'input': {
            'user_id': getData(AppConstance.currentUserPersonID),
            'image_url': fileUrl.value,
            'text': textController.text,
            'created_at': DateTime.now().toString(),
          },
        },
      );
      final QueryResult result = await getClient().mutate(options);
      print('**********$result');
      if (result.data != null) {
        Get.offAndToNamed(Routes.homeScreen);
      } else {
        Utils.validationCheck(
            title: "Error", message: 'Something went wrong!!');
      }
    }
  }
}
