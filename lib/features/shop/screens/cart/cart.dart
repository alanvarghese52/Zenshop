import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenshop/common/widgets/appbar/appbar.dart';
import 'package:zenshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:zenshop/features/shop/screens/checkout/checkout.dart';
import 'package:zenshop/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// item in cart
        child: TCartItems(),
      ),

      /// checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout  ₹1500.0 '),
        ),
      ),
    );
  }
}
