import 'package:flutter/material.dart';
import 'package:zenshop/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/widgets/product_detail_image_slider.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/widgets/product_meta_data.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1-product image slider
            TProductImageSlider(),

            /// 2-product details
            Padding(padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                /// -rating & share
                TRatingAndShare(),

                /// -price, title,stack & brand
                TProductMetaData(),

                /// -attributes
                /// -description
                /// -reviews
              ],
            ),)
          ],
        ),
      ),
    );
  }
}


