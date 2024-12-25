import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/home/data/models/response/get_cart_response_model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {super.key,
      this.onAddClicked,
      this.onMinusClicked,
      this.onRemoveClicked,
      required this.book});
  final Function()? onAddClicked;
  final Function()? onMinusClicked;
  final Function()? onRemoveClicked;
  final CartItem? book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            book?.itemProductImage ?? '',
            width: 100,
            height: 118,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    book?.itemProductName ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getBodyTextStyle(context),
                  ),
                ),
                CloseButton(
                  onPressed: onRemoveClicked,
                ),
              ],
            ),
            Text(
              '${book?.itemProductPriceAfterDiscount} EGP',
              style: getBodyTextStyle(context),
            ),
            const Gap(20),
            Row(
              children: [
                GestureDetector(
                  onTap: onMinusClicked,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),
                const Gap(20),
                Text(
                  book?.itemQuantity.toString() ?? '',
                  style: getBodyTextStyle(context),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: onAddClicked,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            )
          ],
        ))
      ],
    );
  }
}
