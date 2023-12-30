import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenshop/common/styles/spacing_styles.dart';
import 'package:zenshop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:zenshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';
import 'package:zenshop/utils/constants/text_strings.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo, title
              const TLoginHeader(),

              /// form
              const TLoginForm(),

              ///divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}






