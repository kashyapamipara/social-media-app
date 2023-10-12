import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_media_app/app/Network/models/user.model.dart';
import 'package:social_media_app/app/Network/services/graphql_services/graphql_queries.dart';

import '../../Constants/app_utils.dart';
import '../../Constants/graphql_constant.dart';
import '../../Routes/app_pages.dart';

class FollowUnFollowController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<List<UserModel>> users = Rx<List<UserModel>>([]);
  @override
  void onInit() async {
    super.onInit();
    await getAllUserApi();
  }

  Future<void> getAllUserApi() async {
    try {
      isLoading.value = true;
      final result = await getClient().query(
        QueryOptions(
          document: gql(getAllUsers),
        ),
      );

      if (result.hasException) {
        Utils.validationCheck(
            title: 'Error', message: 'Something went wrong!!');
        Get.offAllNamed(Routes.login);
        return;
      }
      if (result.data != null) {
        final data = result.data!['users'] as List<dynamic>;
        users.value = data
            .map(
              (e) => UserModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        print('*******${users.value[0].email}');
        // for (int i = 0; i < newsFeed.value.length; i++) {
        //   final user = await getClient().query(
        //     QueryOptions(
        //       document: gql(getUserById),
        //       variables: {
        //         'user_id': newsFeed.value[i].userId,
        //       },
        //     ),
        //   );
        //   final data = user.data!['user'] as dynamic;
        //   users.value.add(UserModel.fromJson(data as Map<String, dynamic>));
        // }
      }
      isLoading.value = false;
    } catch (e) {
      Utils.validationCheck(title: 'Error', message: 'Something went wrong!!!');
    } finally {}
  }

  ///check sign up

}
