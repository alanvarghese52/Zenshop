import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:zenshop/common/widgets/login_signup/form_divider.dart';
import 'package:zenshop/common/widgets/login_signup/social_buttons.dart';
import 'package:zenshop/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///divider
             TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///social button
              const TSocialButtons(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}


