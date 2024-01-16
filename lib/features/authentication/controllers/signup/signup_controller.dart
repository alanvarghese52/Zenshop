import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// signup
  Future<void> signup() async {
    try{
      // Start loading
      TFullScreenLoader.openLoadingDialog('we are processing your information...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy check

      // register user

      // save user data

      // show success message

      // move to verify email screen

    } catch (e){
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}