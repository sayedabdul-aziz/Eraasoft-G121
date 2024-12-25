import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/presentation/page/cart/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutFooter extends StatelessWidget {
  const CheckoutFooter({
    super.key,
    required this.total,
  });
  final String? total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Total',
                style: getBodyTextStyle(context, color: AppColors.primaryColor),
              ),
            ),
            Text(
              '$total EGP',
              style: getBodyTextStyle(context),
            ),
          ],
        ),
        const Gap(20),
        CustomButton(
          text: 'Checkout',
          onTap: () {
            push(
                context,
                CheckoutView(
                  totalPrice: total ?? '',
                ));
          },
        )
      ],
    );
  }
}
