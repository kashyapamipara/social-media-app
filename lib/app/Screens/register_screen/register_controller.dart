import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_media_app/app/Constants/app_constance.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/app_utils.dart';
import 'package:social_media_app/app/Constants/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/app/Constants/get_storage.dart';
import 'package:social_media_app/app/Constants/graphql_constant.dart';
import 'package:social_media_app/app/Network/services/graphql_services/graphql_queries.dart';
import '../../Routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  FocusNode emailFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmPassword = true.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterEmailAddress;
    } else if (!AppValidators.emailValidator.hasMatch(value)) {
      return AppStrings.invalidEmail;
    } else if (!AppValidators.emailHeadValidator
        .hasMatch(value.split('@')[0])) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterName;
    } else if (!AppValidators.nameValidator.hasMatch(value)) {
      return AppStrings.onlyAlphabetsAreAllowedForTheName;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterPassword;
    }
    return null;
  }

  String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterConfirmPassword;
    } else if (value != password) {
      return AppStrings.passwordNotMatched;
    }
    return null;
  }

  ///check sign up
  Future<void> checkSignUp() async {
    final isValid = signUpKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        setData(AppConstance.currentUserPersonID, userCredential.user?.uid);
        final MutationOptions options =
            MutationOptions(document: gql(createUser), variables: {
          'input': {
            '_id': userCredential.user?.uid,
            'user_id': userCredential.user?.uid,
            'user_name': nameController.text,
            'email': emailController.text,
            'image_url': 'https://picsum.photos/200/300',
          },
        });

        final QueryResult result = await getClient().mutate(options);
        print('**********$result');
        if (result.data != null) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Utils.validationCheck(
              title: "Error", message: 'Something went wrong!!');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Utils.validationCheck(
              title: "Error", message: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Utils.validationCheck(
              title: "Error",
              message: 'The account already exists for that email.');
        }
        return;
      } catch (e) {
        print(e);
        return;
      }

      // setData(AppConstance.authorizationToken, userCredential.);
      // setData(AppConstance.currentUserPersonID, loggedInUser.id);

    }
  }
}
