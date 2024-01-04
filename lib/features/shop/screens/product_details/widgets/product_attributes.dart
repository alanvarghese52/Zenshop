import 'package:flutter/material.dart';
import 'package:zenshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:zenshop/common/widgets/products/product_cards/product_price_text.dart';
import 'package:zenshop/common/widgets/texts/product_title_text.dart';
import 'package:zenshop/common/widgets/texts/section_heading.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///  selected attributes pricing & description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              ///title, price, stock status
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Price: ', smallSize: true),

                          /// actual price
                          Text(
                            '₹ 1299',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// sale price
                          const TProductPriceText(price: '799')
                        ],
                      ),

                      ///Stock
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Stock: ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              ///variation description
              const TProductTitleText(
                  title:
                      'This is the Description of the product and it can go upto max 4 lines',
                  smallSize: true,
                  maxLines: 4),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///-attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Red', selected: true, onSelected: (value) {}),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'IND 8', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'IND 9', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'IND 10', selected: true, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
