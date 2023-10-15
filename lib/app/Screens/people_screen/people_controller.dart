import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_media_app/app/Constants/app_constance.dart';

import 'package:social_media_app/app/Constants/app_utils.dart';
import 'package:get/get.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Constants/graphql_constant.dart';
import 'package:social_media_app/app/Network/models/follower_model.dart';
import 'package:social_media_app/app/Network/models/user.model.dart';
import 'package:social_media_app/app/Network/services/graphql_services/graphql_queries.dart';

class PeopleController extends GetxController {
  Rx<List<UserModel>> users = Rx<List<UserModel>>([]);
  Rx<List<UserModel>> followers = Rx<List<UserModel>>([]);
  Rx<List<UserModel>> unFollowers = Rx<List<UserModel>>([]);
  Rx<List<UserModel>> following = Rx<List<UserModel>>([]);
  Rx<List<FollowerModel>> followerModel = Rx<List<FollowerModel>>([]);
  RxBool isLoading = false.obs;
  RxBool selectedValue = true.obs;
  @override
  void onInit() async {
    await getPoeple();
    super.onInit();
  }

  Future<void> getPoeple() async {
    try {
      isLoading.value = true;
      final result = await getClient().query(
        QueryOptions(
          document: gql(getAllUsers),
        ),
      );
      print(result);
      if (result.hasException) {
        Utils.validationCheck(
            title: 'Error', message: 'Something went wrong!!');
        // Get.offAllNamed(Routes.login);
        return;
      }

      if (result.data != null) {
        print(getData(AppConstance.currentUserPersonID));
        final resultForFollower = await getClient().query(
          QueryOptions(document: gql(getAllFollowers), variables: {
            'input': {
              'user_id': getData(AppConstance.currentUserPersonID),
            },
          }),
        );
        print(resultForFollower);
        if (resultForFollower.hasException) {
          Utils.validationCheck(
              title: 'Error', message: 'Something went wrong!!');
          // Get.offAllNamed(Routes.login);
          return;
        }

        final data = result.data!['getAllUsers'] as List<dynamic>;

        users.value = data
            .map(
              (e) => UserModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        print('11111111');
        users.value.removeWhere((element) =>
            element.user_id == getData(AppConstance.currentUserPersonID));
        print('222222');

        final dataForFollower =
            resultForFollower.data!['getAllFollowers'] as List<dynamic>;
        print('33333333');
        followerModel.value = dataForFollower
            .map(
              (e) => FollowerModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        print('44444');

        for (int k = 0; k < users.value.length; k++) {
          for (int j = 0; j < followerModel.value.length; j++) {
            if (users.value[k].user_id == followerModel.value[j].followerId &&
                followerModel.value[j].user_id ==
                    getData(AppConstance.currentUserPersonID)) {
              followers.value.add(users.value[k]);
            } else {
              unFollowers.value.add(users.value[k]);
            }
          }
        }
        followers.value = followers.value.toSet().toList();
        unFollowers.value = unFollowers.value.toSet().toList();
        for (int i = 0; i < followers.value.length; i++) {
          if (unFollowers.value.contains(followers.value[i])) {
            unFollowers.value.removeWhere(
                (element) => element.user_id == followers.value[i].user_id);
          }
        }
        print('********${users.value.length}');
        print('********${unFollowers.value.length}');
      }
      isLoading.value = false;
    } catch (e) {
      Utils.validationCheck(title: 'Error', message: 'Something went wrong!!!');
    } finally {}
  }

  Future<void> getFollowUnFollowList() async {
    try {
      isLoading.value = true;
      final result = await getClient().query(
        QueryOptions(
          document: gql(getAllUsers),
        ),
      );
      print(result);
      if (result.hasException) {
        Utils.validationCheck(
            title: 'Error', message: 'Something went wrong!!');
        // Get.offAllNamed(Routes.login);
        return;
      }

      if (result.data != null) {
        final data = result.data!['getAllUsers'] as List<dynamic>;

        users.value = data
            .map(
              (e) => UserModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        users.value.removeWhere((element) =>
            element.user_id == getData(AppConstance.currentUserPersonID));
      }
      isLoading.value = false;
    } catch (e) {
      Utils.validationCheck(title: 'Error', message: 'Something went wrong!!!');
    } finally {}
  }

  Future<void> followUnFollowPeople() async {
    try {
      isLoading.value = true;
      final result = await getClient().query(
        QueryOptions(
          document: gql(getAllUsers),
        ),
      );
      print(result);
      if (result.hasException) {
        Utils.validationCheck(
            title: 'Error', message: 'Something went wrong!!');
        // Get.offAllNamed(Routes.login);
        return;
      }

      if (result.data != null) {
        final data = result.data!['getAllUsers'] as List<dynamic>;

        users.value = data
            .map(
              (e) => UserModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        users.value.removeWhere((element) =>
            element.user_id == getData(AppConstance.currentUserPersonID));
      }
      isLoading.value = false;
    } catch (e) {
      Utils.validationCheck(title: 'Error', message: 'Something went wrong!!!');
    } finally {}
  }
}
