import 'package:flutter/material.dart';
import 'package:zenshop/common/widgets/appbar/appbar.dart';
import 'package:zenshop/features/shop/screens/order/widgets/orders_list.dart';
import 'package:zenshop/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appbar
      appBar: TAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        ///order
        child: TOrderListItems(),
      ),
    );
  }
}