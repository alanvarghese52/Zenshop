import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zenshop/data/repositories/authentication/authentication_repository.dart';
import 'package:zenshop/data/repositories/user/user_repository.dart';
import 'package:zenshop/features/authentication/screens/signup/widgets/verify_email.dart';
import '../../../../common/widgets/loaders/network_manager.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// signup
  void signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('we are processing your information...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

        // privacy policy check
        if (!privacyPolicy.value) {
          TLoaders.warningSnackBar(
            title: 'Accepting Privacy Policy',
            message:
            'In order to create account, you must have to read and accept the privacy policy & terms of use',
          );
          return;
        }

        // register user
        final userCredential = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
            email.text.trim(), password.text.trim());

        // save user data
        final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
        );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        // remove loader
        TFullScreenLoader.stopLoading();

        // show success message
        TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

        // move to verify email screen
        Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();

      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}

