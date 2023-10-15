import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_media_app/app/Constants/app_constance.dart';
import 'package:social_media_app/app/Constants/app_utils.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Constants/graphql_constant.dart';
import 'package:social_media_app/app/Network/models/newsFeed_model.dart';
import 'package:social_media_app/app/Network/models/user.model.dart';
import 'package:social_media_app/app/Network/services/graphql_services/graphql_queries.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:get/get.dart';

class NewsFeedController extends GetxController {
  Rx<List<NewsFeedModel>> newsFeed = Rx<List<NewsFeedModel>>([]);
  Rx<List<UserModel>> users = Rx<List<UserModel>>([]);
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await getNewsFeedApi();
  }

  Future<void> getNewsFeedApi() async {
    try {
      isLoading.value = true;
      final result = await getClient().query(
        QueryOptions(
          document: gql(getNewsFeedByPersonId),
        ),
      );
      print(result);
      if (result.hasException) {
        Utils.validationCheck(
            title: 'Error', message: 'Something went wrong!!');
        Get.offAllNamed(Routes.homeScreen);
        return;
      }

      if (result.data != null) {
        final data = result.data!['getPosts'] as List<dynamic>;

        newsFeed.value = data
            .map(
              (e) => NewsFeedModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        for (int i = 0; i < newsFeed.value.length; i++) {
          final user = await getClient().query(
            QueryOptions(
              document: gql(getUserById),
              variables: {
                'input': {
                  'user_id': newsFeed.value[i].userId,
                }
              },
            ),
          );
          print('&&&&&&&&&$user');
          final data = user.data!['getUserById'] as dynamic;
          users.value.add(UserModel.fromJson(data as Map<String, dynamic>));
        }
      }
      isLoading.value = false;
    } catch (e) {
      Utils.validationCheck(title: 'Error', message: 'Something went wrong!!!');
    } finally {}
  }
}
