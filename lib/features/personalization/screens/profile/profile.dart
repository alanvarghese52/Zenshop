import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenshop/common/widgets/appbar/appbar.dart';
import 'package:zenshop/common/widgets/images/t_circular_image.dart';
import 'package:zenshop/common/widgets/texts/section_heading.dart';
import 'package:zenshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:zenshop/utils/constants/image_strings.dart';
import 'package:zenshop/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),

      /// --body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                        image: TImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// -details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///heading profile info
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Name', value: 'Alan Varghese', onPressed: () {}),
              TProfileMenu(
                  title: 'Username', value: 'alanvarghese52', onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'User-ID',
                  value: '45631',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'E-mail',
                  value: 'alanvarghese1000@gmail.com',
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: '+91 9207855783',
                  onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '16 May 2000',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
