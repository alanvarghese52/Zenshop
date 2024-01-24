import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zenshop/common/widgets/loaders/network_manager.dart';
import 'package:zenshop/data/repositories/user/user_repository.dart';
import 'package:zenshop/features/personalization/controllers/user_controller.dart';
import 'package:zenshop/features/personalization/screens/profile/profile.dart';
import 'package:zenshop/utils/constants/image_strings.dart';
import 'package:zenshop/utils/popups/full_screen_loader.dart';
import 'package:zenshop/utils/popups/loaders.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appears
  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      // Start loading
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form Validation
      if(!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // update user's first & last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName' : firstName.text.trim(),
        'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated.');

      // move to previous screen
      Get.off(() => const ProfileScreen());
      } catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}