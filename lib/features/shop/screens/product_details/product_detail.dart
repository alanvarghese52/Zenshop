import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:zenshop/common/widgets/texts/section_heading.dart';
import 'package:zenshop/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:zenshop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/widgets/product_detail_image_slider.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/widgets/product_meta_data.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1-product image slider
            const TProductImageSlider(),

            /// 2-product details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -rating & share
                  const TRatingAndShare(),

                  /// -price, title,stack & brand
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// -attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product description for blue nike t shirt. there are more things that can be  there are more things that can be added but i am writing now.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// -reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Review(199)', showActionButton: false),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
