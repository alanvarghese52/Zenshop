import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zenshop/features/authentication/screens/login/login.dart';

import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// function to show relevant screen
  screenRedirect() async {
    //local storage
    if(kDebugMode){
      print('============= GET STORAGE ==============');
      print(deviceStorage.read('IsFirstTime'));
    }


    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

/* ----------------- Email & password sign in --------------------*/

  /// [Emailauthentication] - signin

  /// [Emailauthentication] - register

  /// [reauthenticate] - reauthenticate user

  /// [emailverification] - mail verification

  /// [Emailauthentication] - forget password

/*------------ federated identity & social sign-in --------------*/

  /// [googleauthentication] - google

  /// [facebookauthentication] - facebook

/*------------ end federated identity & social sign-in --------------*/
}
