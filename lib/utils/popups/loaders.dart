import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';

class TLoaaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customtoast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.darkerGrey.withOpacity(0.9)
                : TColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }
}
