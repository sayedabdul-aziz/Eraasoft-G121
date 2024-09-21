import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: getTitleTextStyle(context),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is RemoveFromWishlistLoadedState) {
            Navigator.pop(context);
            context.read<HomeBloc>().add(GetWishlistEvent());
          } else if (state is RemoveFromWishlistLoadingState ||
              state is GetWishlistLoadingState) {
            showLoadingDialog(context);
          } else if (state is GetWishlistLoadedState) {
            Navigator.pop(context);
          }
        },
        buildWhen: (previous, current) => current is GetWishlistLoadedState,
        builder: (context, state) {
          var wishlistBooks =
              context.read<HomeBloc>().getWishlistResponseModel?.data?.data;
          if (wishlistBooks?.isEmpty ?? false) {
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
              itemCount: wishlistBooks?.length ?? 0,
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
                        imageUrl: wishlistBooks?[index].image ?? '',
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
                                wishlistBooks?[index].name ?? '',
                                style: getBodyTextStyle(context),
                              )),
                              IconButton.outlined(
                                  constraints: const BoxConstraints(
                                      maxHeight: 24, maxWidth: 24),
                                  style: IconButton.styleFrom(),
                                  padding: const EdgeInsets.all(3),
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        RemoveFromWishlistEvent(
                                            productId:
                                                wishlistBooks?[index].id ?? 0));
                                  },
                                  icon: const Icon(Icons.close, size: 16)),
                            ],
                          ),
                          Text(
                            '\$${wishlistBooks?[index].price}',
                            style: getBodyTextStyle(context, fontSize: 16),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                  height: 40,
                                  width: 190,
                                  text: 'Add to cart',
                                  onTap: () {}),
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
