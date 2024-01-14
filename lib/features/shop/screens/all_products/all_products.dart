import 'package:flutter/material.dart';
import 'package:zenshop/common/widgets/appbar/appbar.dart';
import 'package:zenshop/common/widgets/layouts/grid_layout.dart';
import 'package:zenshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:zenshop/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {},
                items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///products
              TGridLayout(itemCount: 8, itemBuilder: (_, index) => const TProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
