import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zenshop/features/authentication/screens/login/login.dart';
import 'package:zenshop/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:zenshop/navigation_menu.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    // remove the native splash screen
    FlutterNativeSplash.remove();
    // redirect to the appropriate screen
    screenRedirect();
  }

  /// function to show relevant screen
  screenRedirect() async {
    final user =_auth.currentUser;

    if(user != null){
      //if the user is logged in
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      // local storage
      deviceStorage.writeIfNull('isFirstTime', true);
      // check if it's the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

/* ----------------- Email & password sign in --------------------*/

  /// [Email authentication] - sign in
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }


  /// [Email authentication] - register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  /// [email verification] - mail verification
  Future<void> sendEmailVerification() async{
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  /// [re authenticate] - re authenticate user

  /// [Email authentication] - forget password

/*------------ federated identity & social sign-in --------------*/

  /// [google authentication] - google
  Future<UserCredential?> signInWithGoogle() async{
    try {
      // trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      //create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // once signed in, return the userCredentials
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if(kDebugMode)print('Something went wrong: $e');
      return null;
    }
  }

  /// [facebook authentication] - facebook

/*------------ end federated identity & social sign-in --------------*/

  /// [logout user] - valid for any authentication.
  Future<void> logout() async{
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
  /// [deleteUser] - Remove userAuth and firebase account.
}
