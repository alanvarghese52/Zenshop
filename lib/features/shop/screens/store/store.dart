import 'package:flutter/material.dart';
import 'package:zenshop/common/widgets/appbar/appbar.dart';
import 'package:zenshop/common/widgets/appbar/tabbar.dart';
import 'package:zenshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:zenshop/common/widgets/layouts/grid_layout.dart';
import 'package:zenshop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:zenshop/common/widgets/texts/section_heading.dart';
import 'package:zenshop/common/widgets/brands/brand_card.dart';
import 'package:zenshop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                            onPressed: () {}),
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
                  bottom: const TTabBar(
                    tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ],
                  )),
            ];
          },

          ///- body -
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
