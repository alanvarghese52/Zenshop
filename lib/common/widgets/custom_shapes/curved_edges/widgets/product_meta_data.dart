import 'package:flutter/material.dart';
import 'package:zenshop/common/widgets/images/t_circular_image.dart';
import 'package:zenshop/common/widgets/products/product_cards/product_price_text.dart';
import 'package:zenshop/common/widgets/texts/product_title_text.dart';
import 'package:zenshop/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:zenshop/utils/constants/enums.dart';
import 'package:zenshop/utils/constants/image_strings.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../containers/rounded_container.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and sale price
        Row(
          children: [
            ///sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            
            ///price
            Text('₹ 1299', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: '799', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        /// title
        const TProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        /// stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        /// brand
        Row(
          children: [
            TCircularImage(image: TImages.shoeIcon,
            width: 32,
            height: 32,
            overlayColor: darkMode ? TColors.white : TColors.black),
            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
