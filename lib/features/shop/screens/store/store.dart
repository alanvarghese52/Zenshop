import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:zenshop/common/widgets/appbar/appbar.dart';
import 'package:zenshop/common/widgets/appbar/tabbar.dart';
import 'package:zenshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:zenshop/common/widgets/layouts/grid_layout.dart';
import 'package:zenshop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:zenshop/common/widgets/texts/section_heading.dart';
import 'package:zenshop/common/widgets/brands/brand_card.dart';
import 'package:zenshop/features/shop/controllers/category_controller.dart';
import 'package:zenshop/features/shop/screens/brand/all_brands.dart';
import 'package:zenshop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        ///--appbar--
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          /// --header--
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// - search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Search in store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      ///featured brands
                      TSectionHeading(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          /// in the backend we will pass the brand & onPress event also.
                          return const TBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                /// tabs
                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },

          ///- body -
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()),
        ),
      ),
    );
  }
}
