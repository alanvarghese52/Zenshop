import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenshop/features/shop/screens/all_products/all_products.dart';
import 'package:zenshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:zenshop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:zenshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///searchbar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body --
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///- heading
                  TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwSections),


                  /// -- popular products
                  TGridLayout(
                      itemCount: 2,
                      itemBuilder: (_, index) => const TProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
