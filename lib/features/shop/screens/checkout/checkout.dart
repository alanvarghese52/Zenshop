import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:zenshop/common/widgets/success_screen/success_screen.dart';
import 'package:zenshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:zenshop/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:zenshop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:zenshop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:zenshop/navigation_menu.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/constants/image_strings.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import 'package:zenshop/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// items in cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///billing section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    ///pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///payment methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      ///checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout  ₹1500.0 '),
        ),
      ),
    );
  }
}
