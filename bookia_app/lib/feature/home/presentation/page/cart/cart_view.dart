import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/page/cart/widgets/cart_item.dart';
import 'package:bookia_app/feature/home/presentation/page/cart/widgets/checkout_footer.dart';
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
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: blocListener,
          builder: blocBuilder,
        ),
      ),
    );
  }

  void blocListener(BuildContext context, HomeState state) {
    if (state is RemoveFromCartLoadingState ||
        state is GetCartLoadingState ||
        state is UpdateCartItemLoadingState) {
      showLoadingDialog(context);
    } else if (state is GetCartLoadedState) {
      Navigator.pop(context);
    } else if (state is RemoveFromCartLoadedState) {
      Navigator.pop(context);
      showSuccessDialog(context, 'Removed from cart');
      context.read<HomeBloc>().add(GetCartEvent());
    } else if (state is UpdateCartItemLoadedState) {
      Navigator.pop(context);
      context.read<HomeBloc>().add(GetCartEvent());
    }
  }

  Widget blocBuilder(BuildContext context, HomeState state) {
    var books = context.read<HomeBloc>().getCartResponseModel?.data?.cartItems;
    return books?.isEmpty ?? true
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 50,
                  color: AppColors.primaryColor,
                ),
                const Gap(10),
                Text(
                  'No books in Your Cart',
                  style: getSmallTextStyle(context),
                )
              ],
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                          book: books?[index],
                          onRemoveClicked: () {
                            context.read<HomeBloc>().add(RemoveFromCartEvent(
                                cartItemId: books?[index].itemId ?? 0));
                          },
                          onAddClicked: () {
                            if ((books?[index].itemQuantity ?? 0) <
                                (books?[index].itemProductStock ?? 0)) {
                              context.read<HomeBloc>().add(UpdateCartItemEvent(
                                  cartItemId: books?[index].itemId ?? 0,
                                  quantity:
                                      (books?[index].itemQuantity ?? 0) + 1));
                            }
                          },
                          onMinusClicked: () {
                            if (books?[index].itemQuantity != 1) {
                              context.read<HomeBloc>().add(UpdateCartItemEvent(
                                  cartItemId: books?[index].itemId ?? 0,
                                  quantity:
                                      (books?[index].itemQuantity ?? 0) - 1));
                            }
                          });
                    },
                    separatorBuilder: (context, index) => const Divider(
                          height: 40,
                        ),
                    itemCount: books?.length ?? 0),
              ),
              CheckoutFooter(
                  total: context
                      .read<HomeBloc>()
                      .getCartResponseModel
                      ?.data
                      ?.total)
            ],
          );
  }
}
