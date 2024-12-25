import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/data/models/response/get_wishlist_response/datum.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
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
        title: const Text('Wishlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
          if (state is RemoveFromWishlistLoadingState ||
              state is GetWishlistLoadingState) {
            showLoadingDialog(context);
          } else if (state is GetWishlistLoadedState) {
            Navigator.pop(context);
          } else if (state is RemoveFromWishlistLoadedState) {
            Navigator.pop(context);
            showSuccessDialog(context, 'Removed from wishlist');
            context.read<HomeBloc>().add(GetWishlistEvent());
          }
        }, builder: (context, state) {
          var books = context.read<HomeBloc>().getWishlistResponse?.data?.data;
          return books?.isEmpty ?? true
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.bookmark_border,
                        size: 50,
                        color: AppColors.primaryColor,
                      ),
                      const Gap(10),
                      Text(
                        'No books in wishlist',
                        style: getSmallTextStyle(context),
                      )
                    ],
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return WishlistItem(books: books?[index]);
                  },
                  separatorBuilder: (context, index) => const Divider(
                        height: 40,
                      ),
                  itemCount: books?.length ?? 0);
        }),
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  const WishlistItem({
    super.key,
    required this.books,
  });

  final Datum? books;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            books?.image ?? '',
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
                    books?.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getBodyTextStyle(context),
                  ),
                ),
                CloseButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(RemoveFromWishlistEvent(books?.id ?? 0));
                  },
                ),
              ],
            ),
            Text(
              '${books?.price} EGP',
              style: getBodyTextStyle(context),
            ),
            const Gap(20),
            CustomButton(height: 40, text: 'Add To Cart', onTap: () {})
          ],
        ))
      ],
    );
  }
}
