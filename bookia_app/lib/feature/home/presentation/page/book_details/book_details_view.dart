import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/back_card_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/data/models/response/best_seller_response_model/product.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const BackCardWidget(),
            const Spacer(),
            InkWell(
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(AddToWishlistEvent(productId: product?.id ?? 0));
                },
                child: SvgPicture.asset('assets/icons/Bookmark.svg')),
            const Gap(8),
          ],
        ),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AddToWishlistLoadedState) {
            Navigator.pop(context);
            showSuccessDialog(context, 'Book added to wishlist');
          } else if (state is AddToCartLoadedState) {
            Navigator.pop(context);
            showSuccessDialog(context, 'Book added to cart');
          } else if (state is AddToWishlistLoadingState ||
              state is AddToCartLoadingState) {
            showLoadingDialog(context);
          } else {
            Navigator.pop(context);
            showErrorDialog(context, 'Something went wrong');
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const Gap(30),
                      Hero(
                        tag: product?.id ?? '',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: product?.image ?? '',
                            width: 180,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const Gap(16),
                      Text(
                        product?.name ?? '',
                        style: getHeadlineTextStyle(context),
                      ),
                      const Gap(16),
                      Text(
                        product?.category ?? '',
                        style: getBodyTextStyle(context,
                            color: AppColors.primaryColor),
                      ),
                      const Gap(16),
                      Text(
                        'Lorem ipsum sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        textAlign: TextAlign.justify,
                        style: getBodyTextStyle(context),
                      ),
                    ]),
                  ),
                ),
                const Gap(10),
                Row(children: [
                  Text('\$${product?.price}',
                      style: getHeadlineTextStyle(context)),
                  const Gap(50),
                  Expanded(
                    child: CustomButton(
                      text: 'Add to cart',
                      color: AppColors.textColor,
                      onTap: () {
                        context
                            .read<HomeBloc>()
                            .add(AddToCartEvent(productId: product?.id ?? 0));
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
