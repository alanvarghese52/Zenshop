import 'package:flutter/material.dart';
import 'package:zenshop/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed:(){}),
        Text('Alan Varghese', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+91 9207855783', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: Text('Kanjirakombil(H), Pathirikode (PO), Puliyakode, Kerala, India',
              style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        )

      ],
    );
  }
}
