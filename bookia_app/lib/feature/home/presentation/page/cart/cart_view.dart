import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getTitleTextStyle(context),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is RemoveFromCartLoadedState) {
            Navigator.pop(context);
            context.read<HomeBloc>().add(GetCartEvent());
          } else if (state is RemoveFromCartLoadingState ||
              state is GetCartLoadingState) {
            showLoadingDialog(context);
          } else if (state is GetCartLoadedState) {
            Navigator.pop(context);
          }
        },
        buildWhen: (previous, current) => current is GetCartLoadedState,
        builder: (context, state) {
          var cartList =
              context.read<HomeBloc>().getCartResponseModel?.data?.cartItems;
          if (cartList?.isEmpty ?? false) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.hourglass_empty_rounded,
                  size: 100,
                  color: AppColors.primaryColor,
                ),
                const Gap(20),
                Text('No books in wishlist',
                    style: getBodyTextStyle(
                      context,
                    )),
              ],
            ));
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              itemCount: cartList?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: cartList?[index].itemProductImage ?? '',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 110,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                cartList?[index].itemProductName ?? '',
                                style: getBodyTextStyle(context),
                              )),
                              IconButton.outlined(
                                  constraints: const BoxConstraints(
                                      maxHeight: 24, maxWidth: 24),
                                  style: IconButton.styleFrom(),
                                  padding: const EdgeInsets.all(3),
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        RemoveFromCartEvent(
                                            cartItemId:
                                                cartList?[index].itemId ?? 0));
                                  },
                                  icon: const Icon(Icons.close, size: 16)),
                            ],
                          ),
                          Text(
                            '\$${cartList?[index].itemTotal?.toStringAsFixed(2)}',
                            style: getBodyTextStyle(context, fontSize: 16),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton.small(
                                backgroundColor: AppColors.borderColor,
                                elevation: 0,
                                onPressed: () {},
                                child: const Icon(Icons.remove),
                              ),
                              const Gap(10),
                              Text(
                                cartList?[index].itemQuantity.toString() ?? '',
                                style: getBodyTextStyle(context),
                              ),
                              const Gap(10),
                              FloatingActionButton.small(
                                backgroundColor: AppColors.borderColor,
                                elevation: 0,
                                onPressed: () {},
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
