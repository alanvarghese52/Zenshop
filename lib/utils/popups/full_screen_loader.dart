import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class TFullScreenLoader {
  /// open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// parameters:
  ///  -text: the text to be displayed in the middle
  ///  -animation: the lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// stop the currently open loading dialog
  /// this method doesn't return anything
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}

