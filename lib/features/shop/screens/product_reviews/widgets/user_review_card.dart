import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:zenshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:zenshop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/constants/image_strings.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Allen s Philip', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        ///review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Dec, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText('The userinterface of the app is quite initive. i was able to navigate and make purchase seamlessly. Great job!',
        trimLines: 1,
        trimMode: TrimMode.Line,
        trimExpandedText: 'show less',
        trimCollapsedText: 'show more',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
        lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// company review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ZenShop', style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Dec, 2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText('The userinterface of the app is quite initive. i was able to navigate and make purchase seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
