import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenshop/common/widgets/shimmers/vertical_product_shimmer.dart';
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
import '../../controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - promo slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///- heading
                  TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- popular products
                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium));
                    }

                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
